import { FC } from "react";
import { EngineDto } from "../../types/TypeCars";
import { Form } from "react-bootstrap";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectEngineComponentProps = {
  name: string;
  engines: EngineDto[];
  engine: EngineDto;
  setEngine: (engineId: number) => void;
};

export const SelectEngineComponent: FC<SelectEngineComponentProps> = ({
  name,
  engines,
  engine,
  setEngine,
}) => {
  return (
    <Form.Select
      name={name}
      size="sm"
      className="fw-bold"
      style={{
        backgroundColor: getColorLevel(engine.levelDto.id),
        color: "white",
        fontFamily: "cursive",
      }}
      value={engine.id}
      onChange={(e) => setEngine(parseInt(e.target.value))}
    >
      {engines.map((eng) => (
        <option
          key={eng.id}
          value={eng.id}
          className="fw-medium"
          style={{
            backgroundColor: getColorLevel(eng.levelDto.id),
            color: "white",
            fontFamily: "cursive",
          }}
        >
          {eng.liters.toFixed(1)+"L "+ eng.model + " " + eng.bhp + " bhp"}
        </option>
      ))}
    </Form.Select>
  );
};
