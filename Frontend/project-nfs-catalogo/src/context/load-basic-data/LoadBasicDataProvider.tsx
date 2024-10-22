import React, { useEffect, useState } from "react";
import {
  AuxiliarDto,
  CarDto,
  ClassesDto,
  EngineDto,
  GearDto,
  InitSkidDto,
  LevelDto,
  MakerDto,
  StreetTypeDto,
  SuspensionDto,
  TireDto,
  TurboDto,
  TurboTypeDto,
} from "../../types/TypeCars";
import { AuthenticationContext } from "../auth/AuthenticationContext";
import { useAuth } from "../auth/useAuth";
import { LoadBasicDataContext } from "./LoadBasicDataContext";
import { useAuxiliariesService } from "../../services/car-data/useAuxiliariesService";
import {
  isApiResponseError,
  loadDataFromLocalStorage,
} from "../../utilities/funcionExport";
import { useCarsService } from "../../services/car-data/useCarsService";
import { useClassesService } from "../../services/car-data/useClassesService";
import { useEnginesService } from "../../services/car-data/useEnginesService";
import { useGearsService } from "../../services/car-data/useGearsService";
import { useInitSkidsService } from "../../services/car-data/useInitSkidsService";
import { useLevelsService } from "../../services/car-data/useLevelsService";
import { useMakersService } from "../../services/car-data/useMakersService";
import { useStreetTypesService } from "../../services/car-data/useStreetTypesService";
import { useSuspensionsService } from "../../services/car-data/useSuspensionsService";
import { useTiresService } from "../../services/car-data/useTiresService";
import { useTurbosService } from "../../services/car-data/useTurbosService";
import { useTurboTypesService } from "../../services/car-data/useTurboTypesService";

export const LoadBasicDataProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const { isAuthenticated, jwtToken } = useAuth(AuthenticationContext);
  const [auxiliars, setAuxiliars] = useState<AuxiliarDto[]>([]);
  const [cars, setCars] = useState<CarDto[]>([]);
  const [classes, setClasses] = useState<ClassesDto[]>([]);
  const [engines, setEngines] = useState<EngineDto[]>([]);
  const [gears, setGears] = useState<GearDto[]>([]);
  const [initSkids, setInitSkids] = useState<InitSkidDto[]>([]);
  const [levels, setLevels] = useState<LevelDto[]>([]);
  const [makers, setMakers] = useState<MakerDto[]>([]);
  const [streetTypes, setStreetTypes] = useState<StreetTypeDto[]>([]);
  const [suspensions, setSuspensions] = useState<SuspensionDto[]>([]);
  const [tires, setTires] = useState<TireDto[]>([]);
  const [turbos, setTurbos] = useState<TurboDto[]>([]);
  const [turboTypes, setTurboTypes] = useState<TurboTypeDto[]>([]);
  const auxiliariesService = useAuxiliariesService();
  const carsService = useCarsService();
  const classesService = useClassesService();
  const enginesService = useEnginesService();
  const gearsService = useGearsService();
  const initSkidsService = useInitSkidsService();
  const levelsService = useLevelsService();
  const makersService = useMakersService();
  const streetTypesService = useStreetTypesService();
  const suspensionsService = useSuspensionsService();
  const tiresService = useTiresService();
  const turbosService = useTurbosService();
  const turboTypesService = useTurboTypesService();

  useEffect(() => {
    const loadData = async (val: number) => {
      //Load data from local storage
      let count = val;
      const savedAuxiliaries =
        loadDataFromLocalStorage<AuxiliarDto[]>("auxiliaries");
      if (savedAuxiliaries) {
        setAuxiliars(savedAuxiliaries);
        count++;
      }
      const savedCars = loadDataFromLocalStorage<CarDto[]>("cars");
      if (savedCars) {
        setCars(savedCars);
        count++;
      }
      const savedClasses = loadDataFromLocalStorage<ClassesDto[]>("classes");
      if (savedClasses) {
        setClasses(savedClasses);
        count++;
      }
      const savedEngines = loadDataFromLocalStorage<EngineDto[]>("engines");
      if (savedEngines) {
        setEngines(savedEngines);
        count++;
      }
      const savedGears = loadDataFromLocalStorage<GearDto[]>("gears");
      if (savedGears) {
        setGears(savedGears);
        count++;
      }
      const savedInitSkids =
        loadDataFromLocalStorage<InitSkidDto[]>("initSkids");
      if (savedInitSkids) {
        setInitSkids(savedInitSkids);
        count++;
      }
      const savedLevels = loadDataFromLocalStorage<LevelDto[]>("levels");
      if (savedLevels) {
        setLevels(savedLevels);
        count++;
      }
      const savedMakers = loadDataFromLocalStorage<MakerDto[]>("makers");
      if (savedMakers) {
        setMakers(savedMakers);
        count++;
      }
      const savedStreetTypes =
        loadDataFromLocalStorage<StreetTypeDto[]>("streetTypes");
      if (savedStreetTypes) {
        setStreetTypes(savedStreetTypes);
        count++;
      }
      const savedSuspensions =
        loadDataFromLocalStorage<SuspensionDto[]>("suspensions");
      if (savedSuspensions) {
        setSuspensions(savedSuspensions);
        count++;
      }
      const savedTires = loadDataFromLocalStorage<TireDto[]>("tires");
      if (savedTires) {
        setTires(savedTires);
        count++;
      }
      const savedTurbos = loadDataFromLocalStorage<TurboDto[]>("turbos");
      if (savedTurbos) {
        setTurbos(savedTurbos);
        count++;
      }
      const savedTurboTypes =
        loadDataFromLocalStorage<TurboTypeDto[]>("turboTypes");
      if (savedTurboTypes) {
        setTurboTypes(savedTurboTypes);
        count++;
      }
      //Load Data from server

      if (count !== 13 && isAuthenticated && jwtToken) {
        //Load auxiliries
        auxiliariesService.chargeTokenInOptions(jwtToken);
        const auxiliariesFetch = await auxiliariesService.getFetch();
        if (auxiliariesFetch.data) {
          if (isApiResponseError(auxiliariesFetch.data)) {
            console.error(
              "Error al cargar los datos auxiliares:",
              auxiliariesFetch.data
            );
            setAuxiliars([]);
          } else {
            setAuxiliars(auxiliariesFetch.data);
            localStorage.setItem(
              "auxiliaries",
              JSON.stringify(auxiliariesFetch.data)
            );
          }
        }
        //Load cars
        carsService.chargeTokenInOptions(jwtToken);
        const carsFetch = await carsService.getFetch();
        if (carsFetch.data) {
          if (isApiResponseError(carsFetch.data)) {
            console.error(
              "Error al cargar los datos de autos:",
              carsFetch.data
            );
            setCars([]);
          } else {
            setCars(
              carsFetch.data.sort((a, b) => {
                const makerComparison = a.makerDto.name.localeCompare(
                  b.makerDto.name
                );
                if (makerComparison !== 0) {
                  return makerComparison; 
                }
                return a.model.localeCompare(b.model);
              })
            );
            localStorage.setItem("cars", JSON.stringify(carsFetch.data));
          }
        }
        //Load classes
        classesService.chargeTokenInOptions(jwtToken);
        const classesFetch = await classesService.getFetch();
        if (classesFetch.data) {
          if (isApiResponseError(classesFetch.data)) {
            console.error(
              "Error al cargar los datos de clases:",
              classesFetch.data
            );
            setClasses([]);
          } else {
            setClasses(classesFetch.data);
            localStorage.setItem("classes", JSON.stringify(classesFetch.data));
          }
        }
        //Load engines
        enginesService.chargeTokenInOptions(jwtToken);
        const enginesFetch = await enginesService.getFetch();
        if (enginesFetch.data) {
          if (isApiResponseError(enginesFetch.data)) {
            console.error(
              "Error al cargar los datos de motores:",
              enginesFetch.data
            );
            setEngines([]);
          } else {
            setEngines(
              enginesFetch.data.sort((a, b) => {
                if (a.levelDto.id !== b.levelDto.id) {
                  return a.levelDto.id - b.levelDto.id;
                }
                return a.liters - b.liters;
              })
            );
            localStorage.setItem("engines", JSON.stringify(enginesFetch.data));
          }
        }
        //Load gears
        gearsService.chargeTokenInOptions(jwtToken);
        const gearsFetch = await gearsService.getFetch();
        if (gearsFetch.data) {
          if (isApiResponseError(gearsFetch.data)) {
            console.error(
              "Error al cargar los datos de cambios:",
              gearsFetch.data
            );
            setGears([]);
          } else {
            setGears(gearsFetch.data);
            localStorage.setItem("gears", JSON.stringify(gearsFetch.data));
          }
        }
        //Load init skids
        initSkidsService.chargeTokenInOptions(jwtToken);
        const initSkidsFetch = await initSkidsService.getFetch();
        if (initSkidsFetch.data) {
          if (isApiResponseError(initSkidsFetch.data)) {
            console.error(
              "Error al cargar los datos de inicializaciones de derrape: ",
              initSkidsFetch.data
            );
            setInitSkids([]);
          } else {
            setInitSkids(initSkidsFetch.data);
            localStorage.setItem(
              "initSkids",
              JSON.stringify(initSkidsFetch.data)
            );
          }
        }
        //Load levels
        levelsService.chargeTokenInOptions(jwtToken);
        const levelsFetch = await levelsService.getFetch();
        if (levelsFetch.data) {
          if (isApiResponseError(levelsFetch.data)) {
            console.error(
              "Error al cargar los datos de niveles:",
              levelsFetch.data
            );
            setLevels([]);
          } else {
            setLevels(levelsFetch.data);
            localStorage.setItem("levels", JSON.stringify(levelsFetch.data));
          }
        }
        //Load makers
        makersService.chargeTokenInOptions(jwtToken);
        const makersFetch = await makersService.getFetch();
        if (makersFetch.data) {
          if (isApiResponseError(makersFetch.data)) {
            console.error(
              "Error al cargar los datos de marcas:",
              makersFetch.data
            );
            setMakers([]);
          } else {
            setMakers(makersFetch.data);
            localStorage.setItem("makers", JSON.stringify(makersFetch.data));
          }
        }
        //Load street types
        streetTypesService.chargeTokenInOptions(jwtToken);
        const streetTypesFetch = await streetTypesService.getFetch();
        if (streetTypesFetch.data) {
          if (isApiResponseError(streetTypesFetch.data)) {
            console.error(
              "Error al cargar los datos de tipos de calles:",
              streetTypesFetch.data
            );
            setStreetTypes([]);
          } else {
            setStreetTypes(streetTypesFetch.data);
            localStorage.setItem(
              "streetTypes",
              JSON.stringify(streetTypesFetch.data)
            );
          }
        }
        //Load suspensions
        suspensionsService.chargeTokenInOptions(jwtToken);
        const suspensionsFetch = await suspensionsService.getFetch();
        if (suspensionsFetch.data) {
          if (isApiResponseError(suspensionsFetch.data)) {
            console.error(
              "Error al cargar los datos de suspension",
              suspensionsFetch.data
            );
            setSuspensions([]);
          } else {
            setSuspensions(suspensionsFetch.data);
            localStorage.setItem(
              "suspensions",
              JSON.stringify(suspensionsFetch.data)
            );
          }
        }
        //Load tires
        tiresService.chargeTokenInOptions(jwtToken);
        const tiresFetch = await tiresService.getFetch();
        if (tiresFetch.data) {
          if (isApiResponseError(tiresFetch.data)) {
            console.error(
              "Error al cargar los datos de pneumáticos:",
              tiresFetch.data
            );
            setTires([]);
          } else {
            setTires(tiresFetch.data);
            localStorage.setItem("tires", JSON.stringify(tiresFetch.data));
          }
        }
        //Load turbos
        turbosService.chargeTokenInOptions(jwtToken);
        const turbosFetch = await turbosService.getFetch();
        if (turbosFetch.data) {
          if (isApiResponseError(turbosFetch.data)) {
            console.error(
              "Error al cargar los datos de turbos:",
              turbosFetch.data
            );
            setTurbos([]);
          } else {
            setTurbos(turbosFetch.data);
            localStorage.setItem("turbos", JSON.stringify(turbosFetch.data));
          }
        }
        //Load turbo types
        turboTypesService.chargeTokenInOptions(jwtToken);
        const turboTypesFetch = await turboTypesService.getFetch();
        if (turboTypesFetch.data) {
          if (isApiResponseError(turboTypesFetch.data)) {
            console.error(
              "Error al cargar los datos de tipos de turbos:",
              turboTypesFetch.data
            );
            setTurboTypes([]);
          } else {
            setTurboTypes(turboTypesFetch.data);
            localStorage.setItem(
              "turboTypes",
              JSON.stringify(turboTypesFetch.data)
            );
          }
        }
      }
    };
    loadData(0);
  }, [isAuthenticated]); // eslint-disable-line react-hooks/exhaustive-deps

  return (
    <LoadBasicDataContext.Provider
      value={{
        auxiliars,
        setAuxiliars,
        cars,
        setCars,
        classes,
        setClasses,
        engines,
        setEngines,
        gears,
        setGears,
        initSkids,
        setInitSkids,
        levels,
        setLevels,
        makers,
        setMakers,
        streetTypes,
        setStreetTypes,
        suspensions,
        setSuspensions,
        tires,
        setTires,
        turbos,
        setTurbos,
        turboTypes,
        setTurboTypes,
      }}
    >
      {children}
    </LoadBasicDataContext.Provider>
  );
};
