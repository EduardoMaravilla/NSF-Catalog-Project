import { useFetchData } from "../../hooks/useFetchData";
import { CarConfigurationDto } from "../../types/TypeCars";
import { ValidTokenResponse } from "../../types/TypesUserLogin";

const URL_Save_Racer_Car = `${import.meta.env.VITE_API_URL}${
  import.meta.env.VITE_API_URL_Save_Racer_Car
}`;

const headers = new Headers({
  "Content-Type": "application/json",
  Authorization: "",
});

const options: RequestInit = {
  method: "POST",
  headers,
  credentials: "include",
};

export const useSaveRacerCarService = () => {
  const chargeTokenAndDataInOptions = (
    jwtToken: string,
    carConfiguracion: CarConfigurationDto
  ) => {
    headers.set("Authorization", `Bearer ${jwtToken}`);
    options.body = JSON.stringify(carConfiguracion);
  };
  const { getFetch } = useFetchData<ValidTokenResponse>(
    URL_Save_Racer_Car,
    options
  );

  return { getFetch, chargeTokenAndDataInOptions };
};