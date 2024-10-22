import { FC } from "react";
import { Form } from "react-bootstrap";
import { TurboDto } from "../../types/TypeCars";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectTurboComponentProps = {
  name: string;
  t: (key: string) => string;
  turboSelected: TurboDto;
  setTurboSelected: (turboId: number) => void;
  turbos: TurboDto[];
};

const traduction: { [key: number]: string } = {
  1: "naturallyAspired",
  2: "centrifugalSupercharger",
  3: "screwSupercharger",
  4: "turbocharger",
  5: "twinTurbo",
  6: "rootsSupercharger",
};

export const SelectTurboComponent: FC<SelectTurboComponentProps> = ({
  name,
  turbos,
  t,
  turboSelected,
  setTurboSelected,
}) => {
  return (
    <Form.Select
      name={name}
      size="sm"
      className="text-wrap fw-bold"
      style={{
        backgroundColor: getColorLevel(turboSelected.levelDto.id),
        color: "white",
      }}
      value={turboSelected.id}
      onChange={(e) => setTurboSelected(parseInt(e.target.value))}
    >
      {turbos.map((turbo) => (
        <option
          key={turbo.id}
          value={turbo.id}
          className="fw-medium"
          style={{
            backgroundColor: getColorLevel(turbo.levelDto.id),
            color: "white",
          }}
        >
          {t(traduction[turbo.turboTypeDto.id])}
        </option>
      ))}
    </Form.Select>
  );
};
