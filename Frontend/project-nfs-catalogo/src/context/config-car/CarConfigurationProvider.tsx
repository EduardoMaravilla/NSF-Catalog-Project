import { FC, ReactNode, useEffect, useState } from "react";
import { CarConfigurationDto, initialCarConfiguration } from "../../types/TypeCars";
import { CarConfigurationContext } from "./CarConfigurationContext";
import { loadDataFromLocalStorage } from "../../utilities/funcionExport";

export const CarConfigurationProvider: FC<{ children: ReactNode }> = ({
  children,
}) => {
  const [carConfigurationCreated, setCarConfigurationCreated] =
    useState<CarConfigurationDto>(JSON.parse(JSON.stringify(initialCarConfiguration)));

  useEffect(() => {
    const carConfigurationLocalStorge =
      loadDataFromLocalStorage<CarConfigurationDto>(
        "car-configuration-created"
      );
    if (carConfigurationLocalStorge) {
      setCarConfigurationCreated(carConfigurationLocalStorge);
    }else {
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(carConfigurationCreated)
      );
    }
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  return (
    <CarConfigurationContext.Provider
      value={{ carConfigurationCreated, setCarConfigurationCreated }}
    >
      {children}
    </CarConfigurationContext.Provider>
  );
};
