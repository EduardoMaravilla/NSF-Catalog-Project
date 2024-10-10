import { FC } from "react";
import { GearDto } from "../../types/TypeCars";
import { Form } from "react-bootstrap";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectGearComponentProps = {
  name: string;
  gear: GearDto;
  setGear: (gearId: number) => void;
  gears: GearDto[];
};

export const SelectGearComponent: FC<SelectGearComponentProps> = ({
  name,
  gear,
  setGear,
  gears,
}) => {
  return (
    <Form.Select
      name={name}
      style={{
        backgroundColor: getColorLevel(gear.levelDto.id),
        color: "white",
      }}
      value={gear.id}
      onChange={(e) => setGear(parseInt(e.target.value))}
    >
      {gears.map((g) => (
        <option
          key={g.id}
          value={g.id}
          style={{
            backgroundColor: getColorLevel(g.levelDto.id),
            color: "black",
          }}
        >
          {g.gearValue}
        </option>
      ))}
    </Form.Select>
  );
};
