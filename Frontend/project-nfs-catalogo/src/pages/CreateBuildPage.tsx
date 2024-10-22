import DriveConfigComponent from "../components/driver-config/DriveConfigComponentCard";
import CarLevelSelectComponent from "../components/card-level/CarLevelSelectComponent";
import CarValuesComponent from "../components/car-pow-tor/CarValuesComponent";
import EnginePartsComponents from "../components/engine-parts/EnginePartsComponents";
import { CarMotorAndExtrasComponent } from "../components/car-motor-extra/CarMotorAndExtrasComponent";
import { FC } from "react";
import { useCarConfiguration } from "../context/config-car/useCarConfiguration";
import { CarConfigurationContext } from "../context/config-car/CarConfigurationContext";
import useWindowSize from "../hooks/useWindowSize";

type CreateBuildPAgeProps = {
  t: (key: string) => string;
};

const CreateBuildPage: FC<CreateBuildPAgeProps> = ({ t }) => {
  const { carConfigurationCreated, setCarConfigurationCreated } =
    useCarConfiguration(CarConfigurationContext);
  const { width } = useWindowSize();

  return (
    <div className="text-light">
      <div className="text-center">
        <p className="fs-2 fw-bold">{t("createBuildtitle")}</p>
        <hr className="fw-bold" />
      </div>
      {width >= 992 ? (
        <>
          <div className="d-flex justify-content-between">
            <div className="flex-fill mx-2 my-2">
              <DriveConfigComponent
                t={t}
                carConfig={carConfigurationCreated}
                setCarConfig={setCarConfigurationCreated}
              />
            </div>
            <div className="flex-fill mx-2 my-2">
              <CarLevelSelectComponent
                t={t}
                carConfig={carConfigurationCreated}
                setCarConfig={setCarConfigurationCreated}
              />
            </div>
            <div className="flex-fill mx-2 my-2">
              <CarValuesComponent
                t={t}
                carConfig={carConfigurationCreated}
                setCarConfig={setCarConfigurationCreated}
              />
            </div>
          </div>
          <div className="d-flex justify-content-between">
            <div className="flex-fill mx-2 my-2">
              <EnginePartsComponents
                t={t}
                carConfig={carConfigurationCreated}
                setCarConfig={setCarConfigurationCreated}
              />
            </div>
            <div className="flex-fill mx-2 my-2">
              <CarMotorAndExtrasComponent
                t={t}
                carConfig={carConfigurationCreated}
                setCarConfig={setCarConfigurationCreated}
              />
            </div>
          </div>
        </>
      ) : (
        <div>
          <div className="my-2">
            <CarLevelSelectComponent
              t={t}
              carConfig={carConfigurationCreated}
              setCarConfig={setCarConfigurationCreated}
            />
          </div>
          <div className="my-2">
            <CarValuesComponent
              t={t}
              carConfig={carConfigurationCreated}
              setCarConfig={setCarConfigurationCreated}
            />
          </div>
          <div className="my-2">
            <DriveConfigComponent
              t={t}
              carConfig={carConfigurationCreated}
              setCarConfig={setCarConfigurationCreated}
            />
          </div>
          <div className="my-2">
            <EnginePartsComponents
              t={t}
              carConfig={carConfigurationCreated}
              setCarConfig={setCarConfigurationCreated}
            />
          </div>
          <div className="my-2">
            <CarMotorAndExtrasComponent
              t={t}
              carConfig={carConfigurationCreated}
              setCarConfig={setCarConfigurationCreated}
            />
          </div>
        </div>
      )}
    </div>
  );
};

export default CreateBuildPage;
