import { FC, useRef, useState } from "react";
import {
  Alert,
  Button,
  Card,
  Col,
  Container,
  Form,
  Row,
} from "react-bootstrap";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { useForm } from "../hooks/useForm";
import {
  isApiResponseError,
  isValidPassword,
} from "../utilities/funcionExport";
import { UpdatePasswordRequest } from "../types/TypeConctact";
import { useRacerUpdatePassword } from "../services/racer/useRacerUpdatePassword";
import { useSearchParams } from "react-router-dom";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import SpinnerComponent from "../components/utils/SpinnerComponent";

type UpdatePasswordPageProps = {
  t: (key: string) => string;
};

const initialForm: UpdatePasswordRequest = {
  password: "",
  confirmPassword: "",
};

const UpdatePasswordPage: FC<UpdatePasswordPageProps> = ({ t }) => {
  const { isLogined, setIsLogined, isAuthenticated } = useAuth(AuthenticationContext);
  const [showPassword, setShowPassword] = useState<boolean>(false);
  const [failEditPassword, setFailEditPassword] = useState<boolean>(false);
  const [failEditConfirmPassword, setFailEditConfirmPassword] =
    useState<boolean>(false);
  const [isServerError, setIsServerError] = useState<boolean>(false);
  const [successRegister, setSuccessRegister] = useState<boolean>(false);

  const { formState, onInputChange, resetForm } = useForm(initialForm); 
  const { password, confirmPassword } = formState;
  const [searchParams] = useSearchParams();
  const token = searchParams.get("token");
  
  const updatePasswordService = useRacerUpdatePassword();
  const captchaService = useRacerValidateReCaptcha();

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const onSubmitUpdatePassword = async (
    event: React.FormEvent<HTMLFormElement>
  ) => {
    event.preventDefault();
    setIsLogined(true);
    setShowPassword(false);

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


    const count = validateData(formState);
    if (count > 0) {
      return;
    }
    if (token) {
      const newPassword: UpdatePasswordRequest = {
        password: password.trim(),
        confirmPassword: confirmPassword.trim(),
      };
      updatePasswordService.chargePasswordAndTokenInOptions(newPassword, token);
      const state = await updatePasswordService.getFetch();
      if (isApiResponseError(state.data)) {
        setIsServerError(true);
      } else {
        const newresponse = state.data as ValidTokenResponse;
        if (newresponse.valid) {
          setSuccessRegister(true);
          resetForm();
        } else {
          setIsServerError(true);
        }
      }
      setIsLogined(false);
    }
  };

  const validateData = (data: UpdatePasswordRequest) => {
    let count = 0;
    if (!(data.password.trim() === data.confirmPassword.trim())) {
      setFailEditConfirmPassword(true);
      count++;
    } else {
      setFailEditConfirmPassword(false);
    }
    if (!isValidPassword(data.password.trim())) {
      setFailEditPassword(true);
      count++;
    } else {
      setFailEditPassword(false);
    }
    return count;
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
          <Card className="profile-card border border-primary text-light">
            <Card.Header className="text-center fw-bold fs-2">
              {t("forgotPasswordResetTitle")}
            </Card.Header>
            <Card.Body>
              <Form
                onSubmit={async (event) => await onSubmitUpdatePassword(event)}
              >
                {successRegister ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center text-center">
                      <Alert
                        variant="success"
                        onClose={() => setSuccessRegister(false)}
                        dismissible
                      >
                        <p>{t("forgotPasswordResetSuccessMessage")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                {isServerError ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center">
                      <Alert
                        variant="danger"
                        onClose={() => setIsServerError(false)}
                        dismissible
                      >
                        <p>{t("loginConnectError")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                <Form.Group className="mb-3">
                  <Row className="justify-content-between align-items-center">
                    <Col>
                      <Form.Label
                        htmlFor="passwordRegister"
                        className="fw-bold fs-5"
                      >
                        {t("cAPassword")}
                      </Form.Label>
                    </Col>
                    <Col>
                      <Form.Check
                        id="showPassword"
                        name="showPassword"
                        reverse
                        label={t("showPassword")}
                        type="checkbox"                        
                        checked={showPassword}
                        onChange={isPasswordVisibility}
                        disabled={isLogined}
                      />
                    </Col>
                  </Row>
                  <Form.Control
                    id="passwordRegister"
                    name="password"
                    type={showPassword ? "text" : "password"}
                    value={password}
                    className="fw-medium"
                    placeholder={t("cAPasswordText")}
                    onChange={onInputChange}
                    autoComplete="new-password webauthn"
                    disabled={isLogined}
                    required
                  />
                  <Form.Text
                    className={
                      failEditPassword ? "text-danger" : "text-secondary"
                    }
                  >
                    {t("cAPasswordMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="repeatPasswordRegister"
                    className="fw-bold fs-5"
                  >
                    {t("cAConfirmPassword")}
                  </Form.Label>
                  <Form.Control
                    id="repeatPasswordRegister"
                    name="confirmPassword"
                    type={showPassword ? "text" : "password"}
                    value={confirmPassword}
                    className="fw-medium"
                    placeholder={t("cAConfirmPasswordText")}
                    onChange={onInputChange}
                    autoComplete="new-password webauthn"
                    disabled={isLogined}
                    required
                  />
                  <Form.Text
                    className={
                      failEditConfirmPassword ? "text-danger" : "text-secondary"
                    }
                  >
                    {t("cAConfirmPasswordMessage")}
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
                    {t("forgotPasswordResetButton")}
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

export default UpdatePasswordPage;
