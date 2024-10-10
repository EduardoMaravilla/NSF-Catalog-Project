import { Col, Row } from "react-bootstrap";
import DriveConfigComponent from "../components/driver-config/DriveConfigComponentCard";
import CarLevelSelectComponent from "../components/card-level/CarLevelSelectComponent";
import CarValuesComponent from "../components/car-pow-tor/CarValuesComponent";
import EnginePartsComponents from "../components/engine-parts/EnginePartsComponents";
import {CarMotorAndExtrasComponent} from "../components/car-motor-extra/CarMotorAndExtrasComponent";
import { FC } from "react";
import { useCarConfiguration } from "../context/config-car/useCarConfiguration";
import { CarConfigurationContext } from "../context/config-car/CarConfigurationContext";

type CreateBuildPAgeProps = {
  t: (key: string) => string;
}

const CreateBuildPage: FC<CreateBuildPAgeProps> = ({t}) => {
  const {carConfigurationCreated, setCarConfigurationCreated} = useCarConfiguration(CarConfigurationContext);
  

  return (
    <>
      <Row>
        <Col>
          <DriveConfigComponent t={t} carConfig={carConfigurationCreated} setCarConfig={setCarConfigurationCreated} />
        </Col>
        <Col>
          <CarLevelSelectComponent t={t} carConfig={carConfigurationCreated} setCarConfig={setCarConfigurationCreated} />
        </Col>
        <Col>
          <CarValuesComponent t={t} carConfig={carConfigurationCreated} setCarConfig={setCarConfigurationCreated} />
        </Col>
      </Row>
      <Row className="my-3">
        <Col>
          <EnginePartsComponents t={t} carConfig={carConfigurationCreated} setCarConfig={setCarConfigurationCreated} />
        </Col>
        <Col>
          <CarMotorAndExtrasComponent t={t} carConfig={carConfigurationCreated} setCarConfig={setCarConfigurationCreated}/>
        </Col>
      </Row>
    </>
  );
};

export default CreateBuildPage;
