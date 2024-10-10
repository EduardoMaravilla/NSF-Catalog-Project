import { useFetchData } from "../../hooks/useFetchData";
import { NewUserProfileReponse, UserEditProfileRequest } from "../../types/TypeConctact";

const URL_Racer_Update = `${import.meta.env.VITE_API_URL}${import.meta.env.VITE_API_URL_Racer_Update}`;

const headers = new Headers({
    "Content-Type": "application/json",
    "Authorization": "",  
  });
  
  const options: RequestInit = {
    method: "POST",
    headers,
    credentials: "include",
  };

export const useRacerUpdateProfile = () => {
    const chargeTokenAndDataInOptions = (jwtToken: string, userEditProfileRequest: UserEditProfileRequest) => {
        headers.set("Authorization", `Bearer ${jwtToken}`);
        options.body = JSON.stringify(userEditProfileRequest); 
      };

      const { getFetch} = useFetchData<NewUserProfileReponse>(URL_Racer_Update, options);
  return {getFetch, chargeTokenAndDataInOptions};
}
