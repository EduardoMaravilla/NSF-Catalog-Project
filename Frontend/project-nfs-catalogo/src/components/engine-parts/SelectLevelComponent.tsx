import { FC } from "react";
import { Form } from "react-bootstrap";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectLevelComponentProps = {
  name: string;
  t: (key: string) => string;
  selectedLevel: number;
  setSelectedLevel: (levelId: number) => void;
};

export const SelectLevelComponent: FC<SelectLevelComponentProps> = ({
  name,
  t,
  selectedLevel,
  setSelectedLevel,
}) => {
  return (
    <Form.Select name={name}
      className="text-wrap"
      size="sm"
      style={{ backgroundColor: getColorLevel(selectedLevel), color: "white" }}
      value={selectedLevel}
      onChange={(e) => setSelectedLevel(parseInt(e.target.value))}
    >
      <option
        style={{ backgroundColor: getColorLevel(1), color: "black" }}
        value={1}
      >
        {t("levelBasic")}
      </option>
      <option
        style={{ backgroundColor: getColorLevel(2), color: "black" }}
        value={2}
      >
        {t("levelSport")}
      </option>
      <option
        style={{ backgroundColor: getColorLevel(3), color: "black" }}
        value={3}
      >
        {t("levelPro")}
      </option>
      <option
        style={{ backgroundColor: getColorLevel(4), color: "black" }}
        value={4}
      >
        {t("levelSuper")}
      </option>
      <option
        style={{ backgroundColor: getColorLevel(5), color: "black" }}
        value={5}
      >
        {t("levelElite")}
      </option>
    </Form.Select>
  );
};
