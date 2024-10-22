import { FC } from "react";
import { Form } from "react-bootstrap";
import { getColorLevel } from "../../utilities/funcionExport";

type SelectLevelComponentProps = {
  name: string;
  t: (key: string) => string;
  selectedLevel: number;
  setSelectedLevel: (levelId: number) => void;
};

const letterColor:string = "white";

export const SelectLevelComponent: FC<SelectLevelComponentProps> = ({
  name,
  t,
  selectedLevel,
  setSelectedLevel,
}) => {
  return (
    <Form.Select
      name={name}
      className="text-wrap fw-bold"
      size="sm"
      style={{ backgroundColor: getColorLevel(selectedLevel), color: letterColor }}
      value={selectedLevel}
      onChange={(e) => setSelectedLevel(parseInt(e.target.value))}
    >
      <option
        className="fw-medium"
        style={{ backgroundColor: getColorLevel(1), color: letterColor }}
        value={1}
      >
        {t("levelBasic")}
      </option>
      <option
        className="fw-medium"
        style={{ backgroundColor: getColorLevel(2), color: letterColor }}
        value={2}
      >
        {t("levelSport")}
      </option>
      <option
        className="fw-medium"
        style={{ backgroundColor: getColorLevel(3), color: letterColor }}
        value={3}
      >
        {t("levelPro")}
      </option>
      <option
        className="fw-medium"
        style={{ backgroundColor: getColorLevel(4), color: letterColor }}
        value={4}
      >
        {t("levelSuper")}
      </option>
      <option
        className="fw-medium"
        style={{ backgroundColor: getColorLevel(5), color: letterColor }}
        value={5}
      >
        {t("levelElite")}
      </option>
    </Form.Select>
  );
};
