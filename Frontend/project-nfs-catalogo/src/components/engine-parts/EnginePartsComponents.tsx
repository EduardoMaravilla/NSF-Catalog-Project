import { Card, Col, Row } from "react-bootstrap";
import { SelectLevelComponent } from "./SelectLevelComponent";
import { CarConfigurationDto } from "../../types/TypeCars";
import { FC } from "react";
import { useLoadBasicData } from "../../context/load-basic-data/useLoadBasicData";
import { LoadBasicDataContext } from "../../context/load-basic-data/LoadBasicDataContext";
import { SelectTurboComponent } from "./SelectTurboComponent";
import { SelectStreetTypeComponent } from "./SelectStreetTypeComponent";
import { SelectGearComponent } from "./SelectGearComponent";

type EnginePartsComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const EnginePartsComponents: FC<EnginePartsComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const { levels, turbos, suspensions, tires, gears } =
    useLoadBasicData(LoadBasicDataContext);

  const updateInductionLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.inductionLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateEcuLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.ecuLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateInjLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.injectionLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateExhaustLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.escapeLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateNitroLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.nitroLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateBrakeLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.brakeLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateEmbragueLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.embregueLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateDifferentialLevel = (levelSelected: number) => {
    const level = levels.find((l) => l.id === levelSelected);
    if (level) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.differencialLevelDto = level;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateTurbo = (turboSelected: number) => {
    const turbo = turbos.find((t) => t.id === turboSelected);
    if (turbo) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.turboDto = turbo;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateSuspension = (suspensionSelected: number) => {
    const suspension = suspensions.find((s) => s.id === suspensionSelected);
    if (suspension) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.suspensionDto = suspension;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };
  const updateTire = (tireSelected: number) => {
    const tire = tires.find((t) => t.id === tireSelected);
    if (tire) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.tireDto = tire;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const updateGear = (gearSelected: number) => {
    const gear = gears.find((g) => g.id === gearSelected);
    if (gear) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.gearDto = gear;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  return (
    <Card>
      <Card.Header className="text-center">
        {t("carConfigurationTitle")}
      </Card.Header>
      <Card.Body className="justify-content-around align-items-center">
        <Row>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carInduction")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectInductionLevel"
                  t={t}
                  selectedLevel={carConfig.inductionLevelDto.id}
                  setSelectedLevel={updateInductionLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carEcu")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectEcuLevel"
                  t={t}
                  selectedLevel={carConfig.ecuLevelDto.id}
                  setSelectedLevel={updateEcuLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carInjertor")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectinjectionLevel"
                  t={t}
                  selectedLevel={carConfig.injectionLevelDto.id}
                  setSelectedLevel={updateInjLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carExhaust")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectExhaustLevel"
                  t={t}
                  selectedLevel={carConfig.escapeLevelDto.id}
                  setSelectedLevel={updateExhaustLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carTurbo")}
              </Card.Header>
              <Card.Body>
                <SelectTurboComponent
                  name="selectTurbo"
                  turbos={turbos}
                  t={t}
                  turboSelected={carConfig.turboDto}
                  setTurboSelected={updateTurbo}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carNitro")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectNitroLevel"
                  t={t}
                  selectedLevel={carConfig.nitroLevelDto.id}
                  setSelectedLevel={updateNitroLevel}
                />
              </Card.Body>
            </Card>
          </Col>
        </Row>
        <Row className="my-2">
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carSuspension")}
              </Card.Header>
              <Card.Body>
                <SelectStreetTypeComponent
                  name="selectSuspension"
                  t={t}
                  streetType={carConfig.suspensionDto}
                  streetTypes={suspensions}
                  setStreetType={updateSuspension}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carBrakes")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectBrakeLevel"
                  t={t}
                  selectedLevel={carConfig.brakeLevelDto.id}
                  setSelectedLevel={updateBrakeLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carTires")}
              </Card.Header>
              <Card.Body>
                <SelectStreetTypeComponent
                  name="selectTire"
                  t={t}
                  streetType={carConfig.tireDto}
                  streetTypes={tires}
                  setStreetType={updateTire}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carClutch")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectEmbragueLevel"
                  t={t}
                  selectedLevel={carConfig.embregueLevelDto.id}
                  setSelectedLevel={updateEmbragueLevel}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carGears")}
              </Card.Header>
              <Card.Body>
                <SelectGearComponent
                  name="selectGear"
                  gear={carConfig.gearDto}
                  gears={gears}
                  setGear={updateGear}
                />
              </Card.Body>
            </Card>
          </Col>
          <Col style={{ width: "100%" }}>
            <Card>
              <Card.Header className="text-center text-wrap">
                {t("carDiferential")}
              </Card.Header>
              <Card.Body>
                <SelectLevelComponent
                  name="selectDifferentialLevel"
                  t={t}
                  selectedLevel={carConfig.differencialLevelDto.id}
                  setSelectedLevel={updateDifferentialLevel}
                />
              </Card.Body>
            </Card>
          </Col>
        </Row>
      </Card.Body>
    </Card>
  );
};

export default EnginePartsComponents;