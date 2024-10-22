import { Button, Card, Col, Row } from "react-bootstrap";
import { useLoadBasicData } from "../../context/load-basic-data/useLoadBasicData";
import { LoadBasicDataContext } from "../../context/load-basic-data/LoadBasicDataContext";
import {
  CarConfigurationDto,
  DriverDto,
  initialCarConfiguration,
} from "../../types/TypeCars";

import { FC, useRef, useState } from "react";
import { SelectAuxiliaryComponent } from "./SelectAuxiliaryComponent";
import { SelectEngineComponent } from "./SelectEngineComponent";
import { getColorLevel, isApiResponseError } from "../../utilities/funcionExport";
import HReCaptchaComponent from "../utils/HReCaptchaComponent";
import { useRacerValidateReCaptcha } from "../../services/racer/useRacerValidateReCaptcha";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import { useAuth } from "../../context/auth/useAuth";
import { AuthenticationContext } from "../../context/auth/AuthenticationContext";
import { ValidTokenResponse } from "../../types/TypesUserLogin";

type CarMotorAndExtrasComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

export const CarMotorAndExtrasComponent: FC<
  CarMotorAndExtrasComponentProps
> = ({ t, carConfig, setCarConfig }) => {
  const { engines, auxiliars } = useLoadBasicData(LoadBasicDataContext);
  const { isAuthenticated, isLogined, setIsLogined } = useAuth(
    AuthenticationContext
  );

  const captchaService = useRacerValidateReCaptcha();

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

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
    const confirmed: boolean = window.confirm(t("confirmResetButton"));
    if (!confirmed) {
      return;
    }

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

  const resetCaptcha = () => {
    if (captchaRef.current) {
      captchaRef.current.resetCaptcha();
      setCaptchaToken(null);
    }
  };

  const onVerifyCaptcha = (token: string | null) => {
    setCaptchaToken(token);
  };

  const onSaveButton = async () => {
    setIsLogined(true);

    if (!captchaToken) {
      alert(t("captchaAlertError"));
      return;
    }
    captchaService.chargeCaptchaTokenInOptions(captchaToken);
    const captchaResponse = await captchaService.getFetch();
    console.log(captchaResponse);
    if (isApiResponseError(captchaResponse.data)) {
      resetCaptcha();
      setIsLogined(false);
      alert(t("captchaValidationError"));
      return;
    }
    const validCaptcha = captchaResponse.data as ValidTokenResponse;
    if (!validCaptcha.valid) {
      resetCaptcha();
      setIsLogined(false);
      alert(t("captchaValidationError"));
      return;
    }

  }

  return (
    <Card className="h-100 text-light profile-card  border border-primary-subtle">
      <Card.Header className="text-center fw-bold fs-5">
        {t("motorAndAuxiliaryTitle")}
      </Card.Header>
      <Card.Body>
        <Row>
          <Col>
            <Card className="without-background border border-primary-subtle">
              <Card.Header className="text-center text-light fw-bold">
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
            <Card className="without-background border border-primary-subtle">
              <Card.Header className="text-center text-light fw-bold">
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
            <Card className="without-background border border-primary-subtle">
              <Card.Header className="text-center text-light fw-bold">
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
        </Row>
        {isAuthenticated ? (
          <Row>
            <HReCaptchaComponent onVerify={onVerifyCaptcha} />
          </Row>
        ) : null}
        <Row className="">
          <Col>
            <Button
              className="w-100 border text-light fw-bold"
              variant="info"
              type="reset"
              onClick={onResetButton}
              disabled={isLogined}
            >
              {t("resetButton")}
            </Button>
          </Col>
          <Col>
            <Button
              className="w-100 text-light fw-bold"
              variant="success"
              type="button"
              onClick={async () => await onSaveButton()}
              disabled={isLogined || captchaToken === null}
            >
              {t("saveButton")}
            </Button>
          </Col>
        </Row>
        <hr />
        <Row className="justify-content-between align-items-center my-3">
          <Col>
            <h6>
              <span
                className="showColorLevel"
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
              <span
                className="showColorLevel"
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
              <span
                className="showColorLevel"
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
              <span
                className="showColorLevel"
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
              <span
                className="showColorLevel"
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
