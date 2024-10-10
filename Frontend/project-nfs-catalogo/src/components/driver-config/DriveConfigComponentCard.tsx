import { Card } from "react-bootstrap";
import SliderDriverComponent from "./SliderDriverComponent";
import SliderDirectionComponent from "./SliderDirectionComponent";
import SliderDownForceComponent from "./SliderDownForceComponent";
import ControlTractionComponent from "./ControlTractionComponent";
import InitSkidComponent from "./InitSkidComponent";
import { FC } from "react";
import { CarConfigurationDto } from "../../types/TypeCars";

type DriveConfigComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const DriveConfigComponent: FC<DriveConfigComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  return (
    <Card>
      <Card.Header className="text-center">{t("drivingConfig")}</Card.Header>
      <Card.Body>
        <SliderDriverComponent
          t={t}
          carConfig={carConfig}
          setCarConfig={setCarConfig}
        />
        <SliderDirectionComponent
          t={t}
          carConfig={carConfig}
          setCarConfig={setCarConfig}
        />
        <SliderDownForceComponent
          t={t}
          carConfig={carConfig}
          setCarConfig={setCarConfig}
        />
        <br />
        <ControlTractionComponent
          t={t}
          carConfig={carConfig}
          setCarConfig={setCarConfig}
        />
        <br />
        <InitSkidComponent
          t={t}
          carConfig={carConfig}
          setCarConfig={setCarConfig}
        />
        <br />
      </Card.Body>
    </Card>
  );
};

export default DriveConfigComponent;
