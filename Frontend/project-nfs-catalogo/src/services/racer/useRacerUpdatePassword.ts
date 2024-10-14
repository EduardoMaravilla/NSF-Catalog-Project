import { useFetchData } from "../../hooks/useFetchData";
import { UpdatePasswordRequest } from "../../types/TypeConctact";
import { ValidTokenResponse } from "../../types/TypesUserLogin";

const URL_Update_Password = `${import.meta.env.VITE_API_URL}${import.meta.env.VITE_API_URL_Update_Password}`;

const headers = new Headers({
    "Content-Type": "application/json",
    "Authorization": `Bearer `,    
  });
  
  const options: RequestInit = {
    method: "POST",
    headers,
    credentials: "include",
  };

export const useRacerUpdatePassword = () => {
    const chargePasswordAndTokenInOptions = (newPassword : UpdatePasswordRequest, jwtToken: string) => {
        headers.set("Authorization", `Bearer ${jwtToken}`);
        options.body = JSON.stringify(newPassword);
      };

      const { getFetch } = useFetchData<ValidTokenResponse>(URL_Update_Password, options);

  return { chargePasswordAndTokenInOptions , getFetch};
}
