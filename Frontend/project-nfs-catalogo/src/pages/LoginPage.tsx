import { Button, Form, Row, Col, Alert } from "react-bootstrap";
import { NavLink, useNavigate } from "react-router-dom";
import {
  AuthenticationRequest,
  AuthenticationResponse,
  ValidTokenResponse,
} from "../types/TypesUserLogin";
import { useForm } from "../hooks/useForm";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { useAuthLoginService } from "../services/auth/useAuthLoginService";
import { useRef, useState } from "react";
import { LoginSuccesful } from "../components/modals-components/LoginSuccesfulModal";
import {
  isApiResponseError,
  isAuthenticationResponse,
} from "../utilities/funcionExport";
import { ApiResponseError } from "../types/TypesErrors";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import SpinnerComponent from "../components/utils/SpinnerComponent";

type loginProps = {
  t: (key: string) => string;
};

const initialForm: AuthenticationRequest = {
  usernameOrEmail: "",
  password: "",
};

export const LoginPage: React.FC<loginProps> = ({ t }) => {
  const { formState, onInputChange, resetForm } =
    useForm<AuthenticationRequest>(initialForm);
  const authenticationRequest = formState;
  const { usernameOrEmail, password } = authenticationRequest;

  const [showAuthError, setShowAuthError] = useState<boolean>(false);
  const [showEmailInvalidError, setShowEmailInvalidError] =
    useState<boolean>(false);
  const [showConnectError, setShowConnectError] = useState<boolean>(false);

  const {
    setJwtToken,
    setIsAuthenticated,
    isLogined,
    setIsLogined,
    isAuthenticated,
  } = useAuth(AuthenticationContext);

  const authLoginService = useAuthLoginService();
  const captchaService = useRacerValidateReCaptcha();

  const [showSuccesfulModal, setShowSuccesfulModal] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const navigate = useNavigate();

  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const onSubmitLogin = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setIsLogined(true);
    setShowPassword(false);

    if (!captchaToken) {
      alert(t("captchaAlertError"));
      return;
    }
    captchaService.chargeCaptchaTokenInOptions(captchaToken);
    const captchaResponse = await captchaService.getFetch();
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

    authLoginService.chargeAuthRequestInOptions(formState);
    const state = await authLoginService.getFetch();
    if (isApiResponseError(state.data)) {
      setIsLogined(false);
      resetForm();
      const errorResponse = state.data as ApiResponseError;
      if (errorResponse.backendMessage === "Email not validated!") {
        setShowEmailInvalidError(true);
      } else {
        setShowAuthError(true);
      }
    } else if (isAuthenticationResponse(state.data)) {
      const authResponse = state.data as AuthenticationResponse;
      setShowSuccesfulModal(true);
      setTimeout(() => {
        localStorage.setItem(
          "token-jwt-nfs-catalog-unbound",
          authResponse.tokenJwt
        );
        setJwtToken(authResponse.tokenJwt);
        setIsAuthenticated(true);
        setIsLogined(false);
        resetForm();
        navigate("/home");
      }, 3000);
    } else {
      setIsLogined(false);
      resetForm();
      setShowConnectError(true);
    }
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

  const handleModalHide = () => {
    setShowSuccesfulModal(false);
  };

  return (
    <div className="d-flex flex-column w-100 h-100 justify-content-center align-items-center">
      <LoginSuccesful
        show={showSuccesfulModal}
        onHide={handleModalHide}
        t={t}
      />
      <h2 className="text-center fs-1 text-light">{t("initLogin")}</h2>
      <Form onSubmit={async (event) => await onSubmitLogin(event)} className="bg-login-custom p-3 rounded-3">
        {showEmailInvalidError ? (
          <Form.Group>
            <Form.Label className="d-flex justify-content-center align-items-center text-center">
              <Alert
                variant="warning"
                onClose={() => setShowEmailInvalidError(false)}
                dismissible
              >
                <p>{t("loginEmailInvalidError")}</p>
              </Alert>
            </Form.Label>
          </Form.Group>
        ) : null}
        {showAuthError ? (
          <Form.Group>
            <Form.Label className="d-flex justify-content-center align-items-center">
              <Alert
                variant="danger"
                onClose={() => setShowAuthError(false)}
                dismissible
              >
                <p>{t("loginAuthError")}</p>
              </Alert>
            </Form.Label>
          </Form.Group>
        ) : null}
        {showConnectError ? (
          <Form.Group>
            <Form.Label className="d-flex justify-content-center align-items-center">
              <Alert
                variant="danger"
                onClose={() => setShowConnectError(false)}
                dismissible
              >
                <p>{t("loginConnectError")}</p>
              </Alert>
            </Form.Label>
          </Form.Group>
        ) : null}
        <Form.Group>
          <Form.Label htmlFor="usernameOrEmail" className="fs-5 fw-bold text-light">
            {t("email")}
          </Form.Label>
          <Form.Control
            id="usernameOrEmail"
            name="usernameOrEmail"
            className="fw-medium"
            type="text"
            placeholder={t("emailMessage")}
            value={usernameOrEmail}
            onChange={onInputChange}
            disabled={isLogined}
            required
            autoComplete="email"
          />
        </Form.Group>
        <Form.Group className="my-2">
          <Row className="d-flex justify-content-between align-items-center ">
            <Col>
              <Form.Label htmlFor="password" className="fs-5 fw-bold text-light">
                {t("password")}
              </Form.Label>
            </Col>
            <Col>
              <Form.Check
                id="showPassword"
                name="showPassword"
                className="fs-6 align-items-center text-light"
                reverse
                label={t("showPassword")}
                type="checkbox"
                checked={showPassword}
                disabled={isLogined}
                onChange={isPasswordVisibility}
              />
            </Col>
          </Row>
          <Form.Control
            id="password"
            name="password"
            className="fw-medium"
            type={showPassword ? "text" : "password"}
            placeholder={t("passwordMessage")}
            value={password}
            onChange={onInputChange}
            disabled={isLogined}
            required
            autoComplete="current-password"
          />
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
            className="w-100 mt-3"
            disabled={isLogined || captchaToken === null}
          >
            {t("loginButton")}
          </Button>
        )}
        {!isLogined ? (
          <>
            <div className="text-center mt-3">
              <NavLink to="/forgot-password" className="text-light">{t("forgotPassword")}</NavLink>
            </div>
            <div className="text-center mt-3">
              <NavLink to="/create-account" className="text-light">{t("signUp")}</NavLink>
            </div>
          </>
        ) : null}
      </Form>
    </div>
  );
};
