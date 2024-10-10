import { FC } from "react";
import { SuspensionDto, TireDto } from "../../types/TypeCars";
import { Form } from "react-bootstrap";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectStreetTypeComponentProps = {
  name: string;
  t: (key: string) => string;
  streetType: SuspensionDto | TireDto;
  setStreetType: (streetTypeId: number) => void;
  streetTypes: SuspensionDto[] | TireDto[];
};

const traduction: { [key: number]: string } = {
  1: "streetTypeNormal",
  2: "streetTypeGrip",
  3: "streetTypeDrift",
  4: "streetTypeProDrift",
  5: "streetTypeAsphalt",
  6: "streetTypeOffRoad",
};

export const SelectStreetTypeComponent: FC<SelectStreetTypeComponentProps> = ({
  name,
  t,
  streetType,
  setStreetType,
  streetTypes,
}) => {
  return (
    <Form.Select
      name={name}
      size="sm"
      style={{
        backgroundColor: getColorLevel(streetType.levelDto.id),
        color: "white",
      }}
      value={streetType.id}
      onChange={(e) => setStreetType(parseInt(e.target.value))}
    >
      {streetTypes.map((sT) =>(<option key={sT.id} value={sT.id} style={{
            backgroundColor: getColorLevel(sT.levelDto.id),
            color: "black",
          }}>{t(traduction[sT.streetTypeDto.id])}</option>))}
    </Form.Select>
  );
};
