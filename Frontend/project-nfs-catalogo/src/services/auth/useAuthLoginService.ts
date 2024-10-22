import {
  AuthenticationRequest,
  AuthenticationResponse,
} from "../../types/TypesUserLogin";
import { useFetchData } from "../../hooks/useFetchData";

const URL_LOGIN = `${import.meta.env.VITE_API_URL}${
  import.meta.env.VITE_API_URL_Auht_Auht
}`;
const options: RequestInit = {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  credentials: "include",
};

export const useAuthLoginService = () => {
  const chargeAuthRequestInOptions = (
    authenticationRequest: AuthenticationRequest
  ) => {
    options.body = JSON.stringify(authenticationRequest);
  };

  const { getFetch } = useFetchData<AuthenticationResponse>(URL_LOGIN, options);

  return { getFetch, chargeAuthRequestInOptions };
};
