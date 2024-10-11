import { FC, useState } from "react";
import { Alert, Button, Card, Col, Container, Form, Row } from "react-bootstrap";
import { useSearchParams } from "react-router-dom";
import { useRacerValidateEmail } from "../services/racer/useRacerValidateEmail";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { isApiResponseError } from "../utilities/funcionExport";
import { NewUserProfileReponse } from "../types/TypeConctact";
import { useLoadProfileData } from "../context/profile-data/useLoadProfileData";
import { LoadProfileDataContext } from "../context/profile-data/LoadProfileDataContext";

type VerifyEmailPageProps = {
  t: (key: string) => string;
};

export const VerifyEmailPage: FC<VerifyEmailPageProps> = ({ t }) => {
  const [searchParams] = useSearchParams();
  const token = searchParams.get("token");
  const { getFetch, chargeTokenInOptions } = useRacerValidateEmail();
  const {setIsLogined, setIsAuthenticated,setJwtToken} = useAuth(AuthenticationContext);
  const [showWarning, setShowWarning] = useState<boolean>(false);
  const {setUserProfile} = useLoadProfileData(LoadProfileDataContext);

  const onVerifyEmail = async () => {
    setIsLogined(true);
    if (token) {
      chargeTokenInOptions(token);
      const state = await getFetch();
      if(isApiResponseError(state.data)){
         setShowWarning(true);
      }else {
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

  return (
    <Container className="d-flex justify-content-center align-items-center">
      <Row>
        <Col>
          <Card className="justify-content-center align-items-center">
            <Card.Header className="text-center fs-2">
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
              <Button
                className="fs-3"
                type="button"
                onClick={async () => await onVerifyEmail()}
              >
                {t("verifyEmailButton")}
              </Button>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};
