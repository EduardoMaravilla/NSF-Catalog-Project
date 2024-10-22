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
import { useSearchParams } from "react-router-dom";
import { useRacerValidateEmail } from "../services/racer/useRacerValidateEmail";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { isApiResponseError } from "../utilities/funcionExport";
import { NewUserProfileReponse } from "../types/TypeConctact";
import { useLoadProfileData } from "../context/profile-data/useLoadProfileData";
import { LoadProfileDataContext } from "../context/profile-data/LoadProfileDataContext";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import SpinnerComponent from "../components/utils/SpinnerComponent";

type VerifyEmailPageProps = {
  t: (key: string) => string;
};

export const VerifyEmailPage: FC<VerifyEmailPageProps> = ({ t }) => {
  const [searchParams] = useSearchParams();
  const token = searchParams.get("token");

  const {
    setIsLogined,
    setIsAuthenticated,
    setJwtToken,
    isAuthenticated,
    isLogined,
  } = useAuth(AuthenticationContext);
  const [showWarning, setShowWarning] = useState<boolean>(false);
  const { setUserProfile } = useLoadProfileData(LoadProfileDataContext);

  const validateEmailService = useRacerValidateEmail();
  const captchaService = useRacerValidateReCaptcha();

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const onVerifyEmail = async () => {
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

    if (token) {
      validateEmailService.chargeTokenInOptions(token);
      const state = await validateEmailService.getFetch();
      if (isApiResponseError(state.data)) {
        setShowWarning(true);
      } else {
        const newUserProfileResponse = state.data as NewUserProfileReponse;
        setIsAuthenticated(true);
        setJwtToken(newUserProfileResponse.authenticationResponse.tokenJwt);
        localStorage.setItem(
          "token-jwt-nfs-catalog-unbound",
          newUserProfileResponse.authenticationResponse.tokenJwt
        );
        setUserProfile(newUserProfileResponse.userProfileResponse);
        localStorage.setItem(
          "user-profile-response",
          JSON.stringify(newUserProfileResponse.userProfileResponse)
        );
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
    <Container className="d-flex justify-content-center align-items-center">
      <Row>
        <Col>
          <Card className="justify-content-center align-items-center my-2 border border-primary profile-card">
            <Card.Header className="text-center fs-2 fw-bold text-light">
              {t("verifyEmailTitle")}
            </Card.Header>
            <Card.Body className="justify-content-center align-items-center text-center">
              {showWarning ? (
                <Form.Group>
                  <Form.Label className="justify-content-center align-items-center text-center">
                    <Alert
                      variant="warning"
                      onClose={() => setShowWarning(false)}
                      dismissible
                    >
                      <p>{t("verifyEmailInvalidError")}</p>
                    </Alert>
                  </Form.Label>
                </Form.Group>
              ) : null}
              {!isAuthenticated ? (
                <HReCaptchaComponent onVerify={onVerifyCaptcha} />
              ) : null}
              {isLogined ? (
                <SpinnerComponent />
              ) : (
                <Button
                  className="fs-3 my-2"
                  type="button"
                  onClick={async () => await onVerifyEmail()}
                  disabled={isLogined || captchaToken === null}
                >
                  {t("verifyEmailButton")}
                </Button>
              )}
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};
