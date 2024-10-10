import { Autocomplete, TextField } from "@mui/material";
import { Card, Image, ListGroup } from "react-bootstrap";
import { useLoadBasicData } from "../../context/load-basic-data/useLoadBasicData";
import { LoadBasicDataContext } from "../../context/load-basic-data/LoadBasicDataContext";
import { CarConfigurationDto, CarDto } from "../../types/TypeCars";
import { FC, SyntheticEvent } from "react";

type CarLevelSelectComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const CarLevelSelectComponent: FC<CarLevelSelectComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const { classes, cars } = useLoadBasicData(LoadBasicDataContext);

  const onClickClass = (value: number) => {
    const newClass = classes.find((c) => c.id === value);
    if (newClass) {
      const newCarConfig: CarConfigurationDto = { ...carConfig };
      newCarConfig.classesDto = newClass;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
  };

  const handleCarSelect = (_: SyntheticEvent, selectedCar: string | null) => {
    const newCarConfig:CarConfigurationDto = { ...carConfig };

    if (selectedCar) {
      const carObject = cars.find(
        (car: CarDto) =>
          `${car.makerDto.name} ${car.model} (${car.year})` === selectedCar
      );

      if (carObject) {
        newCarConfig.carDto = carObject;
      }
    } else {
      newCarConfig.carDto = null;
    }
    setCarConfig(newCarConfig);
    localStorage.setItem(
      "car-configuration-created",
      JSON.stringify(newCarConfig)
    );
  };

  const selectedCar = carConfig.carDto
    ? `${carConfig.carDto.makerDto.name} ${carConfig.carDto.model} (${carConfig.carDto.year})`
    : null;

  return (
    <Card>
      <Card.Header>
        <Autocomplete
          options={cars
            .map(
              (car: CarDto) => `${car.makerDto.name} ${car.model} (${car.year})`
            )
            .sort()}
          value={selectedCar}
          onChange={handleCarSelect}
          clearOnEscape
          renderInput={(params) => (
            <TextField {...params} label={t("carSelect")} />
          )}
        />
      </Card.Header>
      <Card.Body>
        <div className="d-flex flex-column align-items-center">
          <div className="d-flex justify-content-center">
            <Image src="images/car.jpg" height={180} />
          </div>
        </div>
        <hr />
        <Card>
          <Card.Header className="text-center">{t("classSelect")}</Card.Header>
          <Card.Body>
            <ListGroup horizontal>
              {classes.map((classe) => (
                <ListGroup.Item
                  className="text-center"
                  key={classe.id}
                  action
                  active={classe.id === carConfig.classesDto.id}
                  onClick={() => onClickClass(classe.id)}
                >
                  {classe.name}
                </ListGroup.Item>
              ))}
            </ListGroup>
          </Card.Body>
        </Card>
      </Card.Body>
    </Card>
  );
};

export default CarLevelSelectComponent;
