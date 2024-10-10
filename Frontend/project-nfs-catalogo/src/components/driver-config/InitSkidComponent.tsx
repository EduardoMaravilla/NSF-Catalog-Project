import { Box, Typography } from "@mui/material";
import { ChangeEvent, FC } from "react";
import { Form } from "react-bootstrap";
import { CarConfigurationDto, InitSkidDto } from "../../types/TypeCars";
import { useLoadBasicData } from "../../context/load-basic-data/useLoadBasicData";
import { LoadBasicDataContext } from "../../context/load-basic-data/LoadBasicDataContext";

type InitSkidComponentProps = {
  t: (key: string) => string;
  carConfig: CarConfigurationDto;
  setCarConfig: (config: CarConfigurationDto) => void;
};

const InitSkidComponent: FC<InitSkidComponentProps> = ({
  t,
  carConfig,
  setCarConfig,
}) => {
  const { initSkids } = useLoadBasicData(LoadBasicDataContext);

  const handleChange = (event: ChangeEvent<HTMLSelectElement>) => {
    const value = parseInt(event.target.value);
    const initSkid = initSkids.find(
      (initSkid: InitSkidDto) => initSkid.id === value
    );    
    if (initSkid) {
      const newCarConfig:CarConfigurationDto = { ...carConfig };
      newCarConfig.driverDto.initSkidDto = initSkid;
      setCarConfig(newCarConfig);
      localStorage.setItem(
        "car-configuration-created",
        JSON.stringify(newCarConfig)
      );
    }
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
            fontSize: "0.65rem",
            fontWeight: "bold",
            textDecoration: "underline",
          }}
        >
          {t("initSkid")}
        </Typography>
        <Form.Select
          name="selectInitSkids"
          size="sm"
          value={carConfig.driverDto.initSkidDto.id}
          onChange={handleChange}
          style={{ fontSize: "0.65rem" }}
        >
          <option value={4}>{t("isDefault")}</option>
          <option value={3}>{t("isAcc")}</option>
          <option value={2}>{t("isBrake")}</option>
          <option value={1}>{t("tcOFF")}</option>
        </Form.Select>
      </Box>
    </Box>
  );
};

export default InitSkidComponent;
