import {
  Button,
  Form,
  Container,
  Row,
  Col,
  Spinner,
  Alert,
} from "react-bootstrap";
import { NavLink, useNavigate } from "react-router-dom";
import {
  AuthenticationRequest,
  AuthenticationResponse,
} from "../types/TypesUserLogin";
import { useForm } from "../hooks/useForm";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { useAuthLoginService } from "../services/auth/useAuthLoginService";
import { useState } from "react";
import { LoginSuccesful } from "../components/modals-components/LoginSuccesfulModal";
import {
  isApiResponseError,
  isAuthenticationResponse,
} from "../utilities/funcionExport";

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
  const [showAuthError, setShowAuthError] = useState<boolean>(false);
  const [showConnectError, setShowConnectAuthError] = useState<boolean>(false);
  const authenticationRequest = formState;
  const { usernameOrEmail, password } = authenticationRequest;
  const { getFetch, chargeAuthRequestInOptions } = useAuthLoginService();
  const { setJwtToken, setIsAuthenticated, isLogined, setIsLogined } = useAuth(
    AuthenticationContext
  );
  const [showSuccesfulModal, setShowSuccesfulModal] = useState(false);
  const [showPassword, setShowPassword] = useState(false);
  const navigate = useNavigate();

  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const onSubmitLogin = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setIsLogined(true);
    chargeAuthRequestInOptions(formState);
    const state = await getFetch();
    if (isApiResponseError(state.data)) {
      setIsLogined(false);
      resetForm();
      setShowAuthError(true);
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
      setShowConnectAuthError(true);
    }
  };

  const handleModalHide = () => {
    setShowSuccesfulModal(false);
  };

  return (
    <Container
      className="d-flex justify-content-center align-items-center"
      style={{ height: "70vh" }}
    >
      <LoginSuccesful
        show={showSuccesfulModal}
        onHide={handleModalHide}
        t={t}
      />
      <Row className="w-100">
        <Col md={6} lg={4} className="mx-auto">
          <h2 className="text-center mb-4 fs-1">{t("initLogin")}</h2>
          <Form onSubmit={async (event) => await onSubmitLogin(event)}>
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
                    onClose={() => setShowConnectAuthError(false)}
                    dismissible
                  >
                    <p>{t("loginConnectError")}</p>
                  </Alert>
                </Form.Label>
              </Form.Group>
            ) : null}
            <Form.Group>
              <Form.Label htmlFor="usernameOrEmail" className="fs-5">
                {t("email")}
              </Form.Label>
              <Form.Control
                id="usernameOrEmail"
                name="usernameOrEmail"
                type="text"
                placeholder={t("emailMessage")}
                value={usernameOrEmail}
                onChange={onInputChange}
                disabled={isLogined}
                required
                autoComplete="on"
              />
            </Form.Group>
            <Form.Group className="my-2">
              <Row className="justify-content-between align-items-center">
                <Col>
                  <Form.Label htmlFor="password" className="fs-5">
                    {t("password")}
                  </Form.Label>
                </Col>
                <Col>
                  <Form.Check
                    id="showPassword"
                    name="showPassword"
                    className="fs-6"
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
                type={showPassword ? "text" : "password"}
                placeholder={t("passwordMessage")}
                value={password}
                onChange={onInputChange}
                disabled={isLogined}
                required
                autoComplete="on"
              />
            </Form.Group>
            {isLogined ? (
              <Form.Group>
                <Form.Label htmlFor="password" className="d-flex justify-content-center align-items-center">
                  <Spinner animation="border" variant="primary" />
                </Form.Label>
              </Form.Group>
            ) : (
              <Button variant="primary" type="submit" className="w-100 mt-3">
                {t("loginButton")}
              </Button>
            )}
            {!isLogined ? (
              <>
                <div className="text-center mt-3">
                  <NavLink to="/forgot-password">{t("forgotPassword")}</NavLink>
                </div>
                <div className="text-center mt-3">
                  <NavLink to="/create-account">{t("signUp")}</NavLink>
                </div>
              </>
            ) : null}
          </Form>
        </Col>
      </Row>
    </Container>
  );
};
