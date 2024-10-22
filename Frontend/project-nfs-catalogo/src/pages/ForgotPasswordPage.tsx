import {
  Container,
  Row,
  Col,
  Form,
  Button,
  Card,
  Alert,
} from "react-bootstrap";
import { FC, useRef, useState } from "react";
import { useForm } from "../hooks/useForm";
import { isApiResponseError, isValidEmail } from "../utilities/funcionExport";
import { useRacerResetPassword } from "../services/racer/useRacerResetPassword";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { useAuth } from "../context/auth/useAuth";
import SpinnerComponent from "../components/utils/SpinnerComponent";

type ForgotPasswordPageProps = {
  t: (key: string) => string;
};

const initialForm = {
  emailReset: "",
};

const ForgotPasswordPage: FC<ForgotPasswordPageProps> = ({ t }) => {
  const [successRegister, setSuccessRegister] = useState<boolean>(false);
  const [failSendEmail, setFailSendEmail] = useState<boolean>(false);
  const [emailFail, setEmailFail] = useState<boolean>(false);
  const [showConnectError, setShowConnectAuthError] = useState<boolean>(false);
  const { formState, onInputChange, resetForm } = useForm(initialForm);
  const { emailReset } = formState;
  const resetPasswordService = useRacerResetPassword();
  const captchaService = useRacerValidateReCaptcha();
  const { isLogined, setIsLogined, isAuthenticated } = useAuth(
    AuthenticationContext
  );

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const onResetPassword = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setIsLogined(true);

    if (!captchaToken) {
      alert(t("captchaAlertError"));
      return;
    }
    captchaService.chargeCaptchaTokenInOptions(captchaToken);
    const captchaResponse = await captchaService.getFetch();
    console.log(captchaResponse);
    if (isApiResponseError(captchaResponse.data)) {
      resetCaptcha();
      setIsLogined(false);
      alert(t("captchaValidationError"));
      return;
    }
    const validCaptcha = captchaResponse.data as ValidTokenResponse;
    if (!validCaptcha.valid) {
      resetCaptcha();
      setIsLogined(false);
      alert(t("captchaValidationError"));
      return;
    }

    if (!isValidEmail(emailReset)) {
      setEmailFail(true);
      return;
    }
    resetPasswordService.chargeEmailInOptions(emailReset);
    const state = await resetPasswordService.getFetch();
    console.log(state);
    if (isApiResponseError(state.data)) {
      setFailSendEmail(true);
    } else if (state.errors) {
      setShowConnectAuthError(true);
    } else {
      const response = state.data as ValidTokenResponse;
      if (response.valid) {
        setSuccessRegister(true);
        resetForm();
      } else {
        setFailSendEmail(true);
      }
    }
    setIsLogined(false);
  };

  const resetCaptcha = () => {
    if (captchaRef.current) {
      captchaRef.current.resetCaptcha();
      setCaptchaToken(null);
    }
  };

  const onVerifyCaptcha = (token: string | null) => {
    setCaptchaToken(token);
  };

  return (
    <Container>
      <Row>
        <Col>
          <Card className="profile-card text-light border border-primary">
            <Card.Header className="text-center fw-bold fs-2">
              {t("forgotPasswordTitle")}
            </Card.Header>
            <Card.Body>
              <Form onSubmit={async (event) => await onResetPassword(event)}>
                {emailFail ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center text-center">
                      <Alert
                        variant="warning"
                        onClose={() => setEmailFail(false)}
                        dismissible
                      >
                        <p>{t("forgotPasswordInvalidError")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                {failSendEmail ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center text-center">
                      <Alert
                        variant="danger"
                        onClose={() => setFailSendEmail(false)}
                        dismissible
                      >
                        <p>{t("forgotPasswordEmailInvalid")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                {showConnectError ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center">
                      <Alert
                        variant="danger"
                        onClose={() => setShowConnectAuthError(false)}
                        dismissible
                      >
                        <p>{t("loginConnectError")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                {successRegister ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center text-center">
                      <Alert
                        variant="success"
                        onClose={() => setSuccessRegister(false)}
                        dismissible
                      >
                        <p>{t("forgotPasswordSuccessMessage")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                <Form.Group>
                  <Form.Label htmlFor="emailReset" className="fw-bold fs-4">
                    {t("cAEmail")}
                  </Form.Label>
                  <Form.Control
                    id="emailReset"
                    name="emailReset"
                    value={emailReset}
                    className={`bg-dark text-light fw-medium ${
                      isLogined ? "disabled-custom" : ""
                    }`}
                    type="email"
                    placeholder={t("cAEmailText")}
                    onChange={onInputChange}
                    required
                    autoComplete="off"
                  />
                  <Form.Text className="text-light">
                    {t("forgotPasswordText")}
                  </Form.Text>
                </Form.Group>
                {!isAuthenticated ? (
                  <HReCaptchaComponent onVerify={onVerifyCaptcha} />
                ) : null}
                {isLogined ? (
                  <SpinnerComponent />
                ) : (
                  <Button
                    variant="primary"
                    type="submit"
                    className="w-100 mt-3 my-2"
                    disabled={isLogined || captchaToken === null}
                  >
                    {t("forgotPasswordButton")}
                  </Button>
                )}
              </Form>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ForgotPasswordPage;