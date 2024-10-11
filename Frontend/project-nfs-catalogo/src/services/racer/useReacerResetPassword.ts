import { useFetchData } from "../../hooks/useFetchData";
import { ValidTokenResponse } from "../../types/TypesUserLogin";

const URL_Reset_Password = `${import.meta.env.VITE_API_URL}${import.meta.env.VITE_API_URL_Reset_Password}`;

const headers = new Headers({
    "Content-Type": "application/json",    
  });
  
  const options: RequestInit = {
    method: "POST",
    headers,
    credentials: "include",
  };

export const useReacerResetPassword = () => {
    const chargeEmailInOptions = (email: string) => {
        options.body = JSON.stringify({ email });
      };

      const { getFetch} = useFetchData<ValidTokenResponse>(URL_Reset_Password, options);
  return {getFetch, chargeEmailInOptions};
}