import { Card, Col, Row } from "react-bootstrap";
import { CarConfigurationDto } from "../../types/TypeCars";
import { ChangeEvent, FC } from "react";

type CarValuesComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const CarValuesComponent: FC<CarValuesComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const updateCarConfig = (newConfig: CarConfigurationDto) => {
    setCarConfig(newConfig);
    localStorage.setItem(
      "car-configuration-created",
      JSON.stringify(newConfig)
    );
  };

  const onTopSpeedChange = (event: ChangeEvent<HTMLInputElement>) => {
    let value = event.target.value;
    if (value.length <= 0) {
      value = "0";
    }
    const parsedValue = parseFloat(value);
    if (!isNaN(parsedValue) && parsedValue <= 500) {
      const newCarConfig: CarConfigurationDto = {
        ...carConfig,
        topSpeed: parsedValue,
      };
      updateCarConfig(newCarConfig);
    }
  };

  const onOneHundredChange = (event: ChangeEvent<HTMLInputElement>) => {
    let value = event.target.value;
    if (value.length <= 0) {
      value = "0";
    }
    const parsedValue = parseFloat(value);
    if (!isNaN(parsedValue) && parsedValue <= 100) {
      const newCarConfig: CarConfigurationDto = {
        ...carConfig,
        oneHundred: parsedValue,
      };
      updateCarConfig(newCarConfig);
    }
  };

  const onPowerChange = (event: ChangeEvent<HTMLInputElement>) => {
    let value = event.target.value;
    if (value.length <= 0) {
      value = "0";
    }
    const parsedValue = parseFloat(value);
    if (!isNaN(parsedValue) && parsedValue <= 5000) {
      const newCarConfig: CarConfigurationDto = {
        ...carConfig,
        power: parsedValue,
      };
      updateCarConfig(newCarConfig);
    }
  };

  const onMaxTorqueChange = (event: ChangeEvent<HTMLInputElement>) => {
    let value = event.target.value;
    if (value.length <= 0) {
      value = "0";
    }
    const parsedValue = parseFloat(value);
    if (!isNaN(parsedValue) && parsedValue <= 5000) {
      const newCarConfig: CarConfigurationDto = {
        ...carConfig,
        par: parsedValue,
      };
      updateCarConfig(newCarConfig);
    }
  };

  const onFourHundredChange = (event: ChangeEvent<HTMLInputElement>) => {
    let value = event.target.value;
    if (value.length <= 0) {
      value = "0";
    }
    const parsedValue = parseFloat(value);
    if (!isNaN(parsedValue) && parsedValue <= 100) {
      const newCarConfig: CarConfigurationDto = {
        ...carConfig,
        fourHundred: parsedValue,
      };
      updateCarConfig(newCarConfig);
    }
  };

  return (
    <Card className="profile-card text-light border border-primary-subtle h-100 ">
      <Card.Header className="text-center fw-bold fs-5">
        {t("carValuesTitle")}
      </Card.Header>
      <Card.Body className="d-flex flex-column justify-content-between">
        
        <Row className="justify-content-around align-items-center">
          <Col>
            <div
              className="fw-medium"
              style={{
                textAlign: "center",
                border: "0",
                width: "100%",
                textWrap: "wrap",
              }}
            >
              {t("topSpeed")} [km/h]
            </div>
          </Col>
          <Col>
            <input
              name="topSpeed"
              type="number"
              className="without-background text-light fw-medium"
              style={{ textAlign: "center", width: "100%" }}
              value={carConfig.topSpeed.toString()}
              onChange={onTopSpeedChange}
            />
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-around align-items-center">
          <Col>
            <div
            className="fw-medium"
              style={{
                textAlign: "center",
                border: "0",
                width: "100%",
                textWrap: "wrap",
              }}
            >
              0 - 100 km/h [s]
            </div>
          </Col>
          <Col>
            <input
              name="oneHundred"
              type="number"
              className="without-background text-light fw-medium"
              style={{ textAlign: "center", width: "100%" }}
              value={carConfig.oneHundred.toString()}
              onChange={onOneHundredChange}
            />
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-around align-items-center">
          <Col>
            <div
            className="fw-medium"
              style={{
                textAlign: "center",
                border: "0",
                width: "100%",
                textWrap: "wrap",
              }}
            >
              {t("power")} [bhp]
            </div>
          </Col>
          <Col>
            <input
              name="horsePower"
              type="number"
              className="without-background text-light fw-medium"
              style={{ textAlign: "center", width: "100%" }}
              value={carConfig.power.toString()}
              onChange={onPowerChange}
            />
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-around align-items-center">
          <Col>
            <div
            className="fw-medium"
              style={{
                textAlign: "center",
                border: "0",
                width: "100%",
                textWrap: "wrap",
              }}
            >
              {t("maxTorque")} [Nm]
            </div>
          </Col>
          <Col>
            <input
              name="maxTorque"
              type="number"
              className="without-background text-light fw-medium"
              style={{ textAlign: "center", width: "100%" }}
              value={carConfig.par.toString()}
              onChange={onMaxTorqueChange}
            />
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-around align-items-center">
          <Col>
            <div
            className="fw-medium"
              style={{
                textAlign: "center",
                border: "0",
                width: "100%",
                textWrap: "wrap",
              }}
            >
              400 m [s]
            </div>
          </Col>
          <Col>
            <input
              name="fourHundred"
              type="number"
              className="without-background text-light fw-medium"
              style={{ textAlign: "center", width: "100%" }}
              value={carConfig.fourHundred.toString()}
              onChange={onFourHundredChange}
            />
          </Col>
        </Row>
        <br />
      </Card.Body>
    </Card>
  );
};

export default CarValuesComponent;
