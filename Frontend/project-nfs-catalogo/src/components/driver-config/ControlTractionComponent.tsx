import { Box, Typography } from "@mui/material";
import { ChangeEvent, FC } from "react";
import { Form } from "react-bootstrap";
import { CarConfigurationDto } from "../../types/TypeCars";

type ControlTractionComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const ControlTractionComponent: FC<ControlTractionComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const handleChange = (event: ChangeEvent<HTMLSelectElement>) => {
    const value = parseInt(event.target.value);
    const newCarConfig: CarConfigurationDto = { ...carConfig };
    newCarConfig.driverDto.controlTraction = value === 1;
    setCarConfig(newCarConfig);
    localStorage.setItem(
      "car-configuration-created",
      JSON.stringify(newCarConfig)
    );
  };

  return (
    <Box>
      <Box
        sx={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <Typography
          variant="body2"
          sx={{
            fontSize: "0.70rem",
            fontWeight: "bold",
            textDecoration: "underline",
          }}
        >
          {t("tractionControl")}
        </Typography>
        <Typography variant="body2">
          <Form.Select
            name="selectControlTraction"
            size="sm"
            value={carConfig.driverDto.controlTraction ? 1 : 2}
            onChange={handleChange}
            style={{ fontSize: "0.70rem" }}
          >
            <option value={1}>{t("tcON")}</option>
            <option value={2}>{t("tcOFF")}</option>
          </Form.Select>
        </Typography>
      </Box>
    </Box>
  );
};

export default ControlTractionComponent;
