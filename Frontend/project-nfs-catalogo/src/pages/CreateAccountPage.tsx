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
import { TermsAndConditionModal } from "../components/modals-components/TermsAndConditionModal";
import { UserSaveDto } from "../types/TypeConctact";
import { useForm } from "../hooks/useForm";
import {
  isApiResponseError,
  isValidEmail,
  isValidPassword,
  isValidStringLength,
} from "../utilities/funcionExport";
import { useRacerRegisterProfile } from "../services/racer/useRacerRegisterProfile";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { ApiResponseError } from "../types/TypesErrors";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import SpinnerComponent from "../components/utils/SpinnerComponent";

type CreateAccountPageProps = {
  t: (key: string) => string;
};

const initialUserRegister: UserSaveDto = {
  name: "",
  username: "",
  email: "",
  password: "",
  repeatedPassword: "",
};

const CreateAccountPage: FC<CreateAccountPageProps> = ({ t }) => {
  const [showModal, setShowModal] = useState<boolean>(false);
  const [isTermsAccepted, setIsTermsAccepted] = useState<boolean>(false);
  const [showPassword, setShowPassword] = useState<boolean>(false);
  const [failEditName, setFailEditName] = useState<boolean>(false);
  const [failEditUsername, setFailEditUsername] = useState<boolean>(false);
  const [failEditEmail, setFailEditEmail] = useState<boolean>(false);
  const [failEditPassword, setFailEditPassword] = useState<boolean>(false);

  const [failEditRepeatedPassword, setFailEditRepeatedPassword] =
    useState<boolean>(false);
  const [invalidUsername, setInvalidUsername] = useState<boolean>(false);
  const [invalidEmail, setInvalidEmail] = useState<boolean>(false);
  const [isServerError, setIsServerError] = useState<boolean>(false);
  const [isTermAcceptError, setIsTermAcceptError] = useState<boolean>(false);

  const [successRegister, setSuccessRegister] = useState<boolean>(false);
  const racerRegisterProfileService = useRacerRegisterProfile();
  const captchaService = useRacerValidateReCaptcha();
  const { isLogined, setIsLogined, isAuthenticated } = useAuth(
    AuthenticationContext
  );
  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const { formState, onInputChange, resetForm } =
    useForm<UserSaveDto>(initialUserRegister);
  const { name, username, email, password, repeatedPassword } = formState;

  const handleCheckboxChange = () => {
    setShowModal(!isLogined);
  };

  const handleModalHide = () => {
    setShowModal(false);
  };

  const handleTermsAccepted = (e: React.ChangeEvent<HTMLInputElement>) => {
    setIsTermsAccepted(e.target.checked);
  };
  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const onSubmitCreateAccount = async (
    event: React.FormEvent<HTMLFormElement>
  ) => {
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

    const count = validateData(formState);
    if (count > 0 || !isTermsAccepted) {
      setIsLogined(false);
      setIsTermAcceptError(true);
      return;
    }
    const userSave: UserSaveDto = {
      name: formState.name.trim(),
      username: formState.username.trim(),
      email: formState.email.trim(),
      password: formState.password.trim(),
      repeatedPassword: formState.repeatedPassword.trim(),
    };
    racerRegisterProfileService.chargeRegisterInOptions(userSave);
    const state = await racerRegisterProfileService.getFetch();
    if (isApiResponseError(state.data)) {
      const responseError = state.data as ApiResponseError;
      if (responseError.backendMessage === "User already exists") {
        setInvalidUsername(true);
      } else if (responseError.backendMessage === "Email already exists") {
        setInvalidEmail(true);
      } else {
        setIsServerError(true);
      }
      setIsLogined(false);
      return;
    } else {
      const validResponse = state.data as ValidTokenResponse;
      if (validResponse.valid) {
        setSuccessRegister(true);
      } else {
        setIsServerError(true);
      }
    }
    resetForm();
    setIsTermsAccepted(false);
    setIsLogined(false);
  };

  const validateData = (data: UserSaveDto) => {
    let count = 0;
    if (!isValidStringLength(data.name.trim())) {
      setFailEditName(true);
      count++;
    } else {
      setFailEditName(false);
    }
    if (!isValidStringLength(data.username.trim())) {
      setFailEditUsername(true);
      count++;
    } else {
      setFailEditUsername(false);
    }
    if (!isValidEmail(data.email.trim())) {
      setFailEditEmail(true);
      count++;
    } else {
      setFailEditEmail(false);
    }
    if (!(data.password.trim() === data.repeatedPassword.trim())) {
      setFailEditRepeatedPassword(true);
      count++;
    } else {
      setFailEditRepeatedPassword(false);
    }
    if (!isValidPassword(data.password.trim())) {
      setFailEditPassword(true);
      count++;
    } else {
      setFailEditPassword(false);
    }
    return count;
  };

  const onVerifyCaptcha = (token: string | null) => {
    setCaptchaToken(token);
  };

  const resetCaptcha = () => {
    if (captchaRef.current) {
      captchaRef.current.resetCaptcha();
      setCaptchaToken(null);
    }
  };

  return (
    <Container className="d-flex justify-content-center align-items-center w-100 my-2">
      <Row className="w-100">
        <Col
          md={6}
          lg={10}
          className="d-flex justify-content-center align-items-center mx-auto"
        >
          <Card className="profile-card text-light border border-primary">
            <Card.Header className="text-center fw-bold fs-3">
              {t("createAccountTitle")}
            </Card.Header>
            <Card.Body>
              {successRegister ? (
                <Form.Group>
                  <Form.Label className="d-flex justify-content-center align-items-center text-center">
                    <Alert
                      variant="success"
                      onClose={() => setSuccessRegister(false)}
                      dismissible
                    >
                      <p>{t("cASuccesRegisterMessage")}</p>
                    </Alert>
                  </Form.Label>
                </Form.Group>
              ) : null}
              {isTermAcceptError ? (
                <Form.Group>
                  <Form.Label className="d-flex justify-content-center align-items-center text-center">
                    <Alert
                      variant="warning"
                      onClose={() => setIsTermAcceptError(false)}
                      dismissible
                    >
                      <p>{t("termsAndContitionsError")}</p>
                    </Alert>
                  </Form.Label>
                </Form.Group>
              ) : null}
              {invalidUsername ? (
                <Form.Group>
                  <Form.Label className="d-flex justify-content-center align-items-center text-center">
                    <Alert
                      variant="warning"
                      onClose={() => setInvalidUsername(false)}
                      dismissible
                    >
                      <p>{t("cAInvalidUsername")}</p>
                    </Alert>
                  </Form.Label>
                </Form.Group>
              ) : null}
              {invalidEmail ? (
                <Form.Group>
                  <Form.Label className="d-flex justify-content-center align-items-center text-center">
                    <Alert
                      variant="warning"
                      onClose={() => setInvalidEmail(false)}
                      dismissible
                    >
                      <p>{t("cAInvalidEmail")}</p>
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
              <Form
                onSubmit={async (event) => await onSubmitCreateAccount(event)}
              >
                <Form.Group className="mb-3">
                  <Form.Label htmlFor="nameRegister" className="fw-bold fs-5">
                    {t("cAName")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="nameRegister"
                    name="name"
                    type="text"
                    value={name}
                    className="fw-medium"
                    placeholder={t("cANameText")}
                    onChange={onInputChange}
                    autoComplete="name"
                    required
                    disabled={isLogined}
                  />
                  <Form.Text
                    className={failEditName ? "text-danger" : "text-secondary"}
                  >
                    {t("cANameMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="usernameRegister"
                    className="fw-bold fs-5"
                  >
                    {t("cAUsername")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="usernameRegister"
                    name="username"
                    type="text"
                    className="fw-medium"
                    value={username}
                    placeholder={t("cAUsernameText")}
                    onChange={onInputChange}
                    autoComplete="username"
                    disabled={isLogined}
                    required
                  />
                  <Form.Text
                    className={
                      failEditUsername ? "text-danger" : "text-secondary"
                    }
                  >
                    {t("cAUsernameMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label htmlFor="emailRegister" className="fw-bold fs-5">
                    {t("cAEmail")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="emailRegister"
                    name="email"
                    type="email"
                    value={email}
                    className="fw-medium"
                    placeholder={t("cAEmailText")}
                    onChange={onInputChange}
                    autoComplete="email"
                    disabled={isLogined}
                    required
                  />
                  <Form.Text
                    className={failEditEmail ? "text-danger" : "text-secondary"}
                  >
                    {t("cAEmailMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Row className="justify-content-between align-items-center">
                    <Col>
                      <Form.Label
                        htmlFor="passwordRegister"
                        className="fw-bold fs-5"
                      >
                        {t("cAPassword")}
                        <span className="text-danger fs-6">
                          <sup>*</sup>
                        </span>
                      </Form.Label>
                    </Col>
                    <Col>
                      <Form.Check
                        id="showPassword"
                        name="showPassword"
                        className="fw-medium"
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
                    placeholder={t("cAPasswordText")}
                    onChange={onInputChange}
                    className="fw-medium"
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
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="repeatPasswordRegister"
                    name="repeatedPassword"
                    className="fw-medium"
                    type={showPassword ? "text" : "password"}
                    value={repeatedPassword}
                    placeholder={t("cAConfirmPasswordText")}
                    onChange={onInputChange}
                    autoComplete="new-password webauthn"
                    disabled={isLogined}
                    required
                  />
                  <Form.Text
                    className={
                      failEditRepeatedPassword
                        ? "text-danger"
                        : "text-secondary"
                    }
                  >
                    {t("cAConfirmPasswordMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Check type="checkbox">
                    <Form.Check.Input
                      id="checkBoxTermsAndConditions"
                      type="checkbox"
                      checked={isTermsAccepted}
                      onChange={handleTermsAccepted}
                      isValid
                      disabled={isLogined}
                    />
                    <Form.Check.Label htmlFor="checkBoxTermsAndConditions">
                      {t("cAAcceptTerms")}
                    </Form.Check.Label>
                    <Form.Control.Feedback type="valid">
                      <span
                        style={{
                          textDecoration: "underline",
                          cursor: "pointer",
                        }}
                        onClick={handleCheckboxChange}
                      >
                        {t("cAShowTerms")}
                      </span>
                    </Form.Control.Feedback>
                    <Form.Control.Feedback type="valid">
                      {isTermsAccepted ? null : t("termsAndContitionsError")}
                    </Form.Control.Feedback>
                  </Form.Check>
                </Form.Group>
                <TermsAndConditionModal
                  show={showModal}
                  onHide={handleModalHide}
                  t={t}
                />
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
                    {t("cAConfirmButton")}
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

export default CreateAccountPage;
