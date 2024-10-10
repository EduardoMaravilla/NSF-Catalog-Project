import { Form } from "react-bootstrap";
import { AuxiliarDto } from "../../types/TypeCars";
import { FC } from "react";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectAuxiliaryComponentProps = {
  t : (key:string) => string
  name: string;
  auxiliars: AuxiliarDto[];
  auxiliar: AuxiliarDto;
  setAuxiliar: (auxiliarId: number) => void;
};

const traduction: { [key:number]:string} ={
  1: "emptySpace",
  2: "impactProtection",
  3: "damageBoost",
  4: "repairKit",
  5: "driftNitro",
  6: "nitroGrip",
  7: "brushNitro",
  8: "slipstreamNitro",
  9: "jumpNitro",
  10: "impactProtection",
  11: "damageBoost",
  12: "repairKit",
  13: "driftNitro",
  14: "nitroGrip",
  15: "brushNitro",
  16: "slipstreamNitro",
  17: "jumpNitro",
  18: "radioJammer",
  19: "runawayDriver",
};

export const SelectAuxiliaryComponent: FC<
  SelectAuxiliaryComponentProps
> = ({t, name, auxiliars, auxiliar, setAuxiliar }) => {
  return (
    <Form.Select
      name={name}
      size="sm"
      style={{
        backgroundColor: getColorLevel(auxiliar.levelDto.id),
        color: "white",
      }}
      value={auxiliar.id}
      onChange={(e) => setAuxiliar(parseInt(e.target.value))}
    >
      {auxiliars.map((aux) => (
        <option key={aux.id} value={aux.id} style={{
          backgroundColor: getColorLevel(aux.levelDto.id),
          color: "white",
        }}>
          {t(traduction[aux.id])}
        </option>
      ))}
    </Form.Select>
  );
};
