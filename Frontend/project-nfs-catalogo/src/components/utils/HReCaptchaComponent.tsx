import HCaptcha from "@hcaptcha/react-hcaptcha";
import { FC, useRef } from "react";
import { Form } from "react-bootstrap";

type HReCaptchaComponentProps = {
  onVerify: (token: string | null) => void;
};

const HReCaptchaComponent: FC<HReCaptchaComponentProps> = ({ onVerify }) => {
  const captchaRef = useRef<HCaptcha | null>(null);

  const handleCaptchaLoad = () => {
    console.log("hCaptcha has loaded successfully");
  };

  return (
    <Form.Group className="d-flex justify-content-center align-items-center my-4">
      <HCaptcha
        theme="dark"
        sitekey={import.meta.env.VITE_API_Public_Key_ReCaptcha}
        onVerify={onVerify}
        ref={captchaRef}
        onLoad={handleCaptchaLoad}
      />
    </Form.Group>
  );
};

export default HReCaptchaComponent;
