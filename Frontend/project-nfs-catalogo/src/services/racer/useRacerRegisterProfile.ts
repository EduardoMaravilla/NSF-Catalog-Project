import { useFetchData } from "../../hooks/useFetchData";
import { UserSaveDto } from "../../types/TypeConctact";
import { ValidTokenResponse } from "../../types/TypesUserLogin";

const URL_Register = `${import.meta.env.VITE_API_URL}${import.meta.env.VITE_API_URL_Racer_Register}`

const headers = new Headers({
  "Content-Type": "application/json",
});

const options: RequestInit = {
  method: "POST",
  headers,
  credentials: "include",
};

export const useRacerRegisterProfile = () => {

  const chargeRegisterInOptions = (userSaveProfile: UserSaveDto) => {
    options.body = JSON.stringify(userSaveProfile);
  };

  const { getFetch } = useFetchData<ValidTokenResponse>(URL_Register, options);

  return {getFetch ,chargeRegisterInOptions};
};
