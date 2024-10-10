import { Button, Card, Col, Row } from "react-bootstrap";
import { useLoadBasicData } from "../../context/load-basic-data/useLoadBasicData";
import { LoadBasicDataContext } from "../../context/load-basic-data/LoadBasicDataContext";
import {
  CarConfigurationDto,
  DriverDto,
  initialCarConfiguration,
} from "../../types/TypeCars";

import { FC } from "react";
import { SelectAuxiliaryComponent } from "./SelectAuxiliaryComponent";
import { SelectEngineComponent } from "./SelectEngineComponent";
import { getColorLevel } from "../../utilities/funcionExport";

type CarMotorAndExtrasComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

export const CarMotorAndExtrasComponent: FC<CarMotorAndExtrasComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const { engines, auxiliars } = useLoadBasicData(LoadBasicDataContext);

  const updateAuxliaryOne = (auxSelected: number) => {
    const aux = auxiliars.find((a) => a.id === auxSelected);
    if (aux) {
      const newCarConfig: CarConfigurationDto = { ...carConfig };
      newCarConfig.auxiliarOneDto = aux;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateAuxliaryTwo = (auxSelected: number) => {
    const aux = auxiliars.find((a) => a.id === auxSelected);
    if (aux) {
      const newCarConfig: CarConfigurationDto = { ...carConfig };
      newCarConfig.auxiliarTwoDto = aux;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateEngine = (engineSelected: number) => {
    const engine = engines.find((e) => e.id === engineSelected);
    if (engine) {
      const newCarConfig: CarConfigurationDto = { ...carConfig };
      newCarConfig.engineDto = engine;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const onResetButton = () => {
    const newCarConfig: CarConfigurationDto = { ...initialCarConfiguration };
    const newDriverDto: DriverDto = {
      id: null,
      drive: 0,
      direction: 0,
      downForce: 0,
      controlTraction: false,
      initSkidDto: { id: 4, skidType: "POR DEFECTO" },
    };
    newCarConfig.driverDto = newDriverDto;
    setCarConfig(newCarConfig);
    localStorage.setItem(
      "car-configuration-created",
      JSON.stringify(newCarConfig)
    );
  };

  return (
    <Card>
      <Card.Header className="text-center">
        {t("motorAndAuxiliaryTitle")}
      </Card.Header>
      <Card.Body>
        <Row>
          <Col>
            <Card>
              <Card.Header className="text-center">
                {t("auxiliaryOne")}
              </Card.Header>
              <Card.Body>
                <SelectAuxiliaryComponent
                  t={t}
                  name="auxiliarOne"
                  auxiliars={auxiliars}
                  auxiliar={carConfig.auxiliarOneDto}
                  setAuxiliar={updateAuxliaryOne}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col>
            <Card>
              <Card.Header className="text-center">
                {t("auxiliaryTwo")}
              </Card.Header>
              <Card.Body>
                <SelectAuxiliaryComponent
                  t={t}
                  name="auxliarTwo"
                  auxiliars={auxiliars}
                  auxiliar={carConfig.auxiliarTwoDto}
                  setAuxiliar={updateAuxliaryTwo}
                />
              </Card.Body>
            </Card>
          </Col>
        </Row>
        <Row className="justify-content-around align-items-center my-2">
          <Col>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("engineTitle")}
              </Card.Header>
              <Card.Body>
                <SelectEngineComponent
                  name="selectEngine"
                  engine={carConfig.engineDto}
                  engines={engines}
                  setEngine={updateEngine}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col>
            <Row className="my-2">
              <Button variant="info" type="reset" onClick={onResetButton}>
                {t("resetButton")}
              </Button>
            </Row>
            <Row>
              <Button variant="success">{t("saveButton")}</Button>
            </Row>
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-between align-items-center my-3">
          <Col>
            <h6>
              <span className="showColorLevel"
                style={{
                  background: getColorLevel(1),
                }}
              >
                {t("levelBasic")}
              </span>
            </h6>
          </Col>
          <Col>
            <h6>
              <span className="showColorLevel"
                style={{
                  background: getColorLevel(2),
                }}
              >
                {t("levelSport")}
              </span>
            </h6>
          </Col>
          <Col>
            <h6>
              <span className="showColorLevel"
                style={{
                  background: getColorLevel(3),
                }}
              >
                {t("levelPro")}
              </span>
            </h6>
          </Col>
          <Col>
            <h6>
              <span className="showColorLevel"
                style={{
                  background: getColorLevel(4),
                }}
              >
                {t("levelSuper")}
              </span>
            </h6>
          </Col>
          <Col>
            <h6>
              <span className="showColorLevel"
                style={{
                  background: getColorLevel(5),
                }}
              >
                {t("levelElite")}
              </span>
            </h6>
          </Col>
        </Row>
      </Card.Body>
    </Card>
  );
};