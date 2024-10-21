import { useFetchData } from "../../hooks/useFetchData";
import { NewUpdatePasswordRequest, NewUserProfileReponse } from "../../types/TypeConctact";

const URL_Profile_Update_Password = `${import.meta.env.VITE_API_URL}${
  import.meta.env.VITE_API_URL_Profile_Password_Update
}`;

const headers = new Headers({
  "Content-Type": "application/json",
  Authorization: `Bearer `,
});

const options: RequestInit = {
  method: "POST",
  headers,
  credentials: "include",
};

export const useRacerProfileUpdatePassword = () => {
    const chargeTokenAndDataInOptions = (jwtToken: string, newUpdatePasswordRequest: NewUpdatePasswordRequest ) => {
        headers.set("Authorization", `Bearer ${jwtToken}`);
        options.body = JSON.stringify(newUpdatePasswordRequest); 
      };
  
      const { getFetch } = useFetchData<NewUserProfileReponse>(URL_Profile_Update_Password, options);

  return {getFetch , chargeTokenAndDataInOptions};
};
