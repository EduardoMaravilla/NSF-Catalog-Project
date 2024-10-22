import {
  Alert,
  Button,
  Card,
  Col,
  Container,
  Form,
  Row,
} from "react-bootstrap";
import { ContactFormRequest } from "../types/TypeConctact";
import { useForm } from "../hooks/useForm";
import { FC, useRef, useState } from "react";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import {
  isApiResponseError,
  isValidTokenResponse,
} from "../utilities/funcionExport";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import SpinnerComponent from "../components/utils/SpinnerComponent";
import { useAuthContactService } from "../services/auth/useAuthContactService";

const initialForm: ContactFormRequest = {
  nameContact: "",
  emailContact: "",
  subjectContact: "",
  messageContact: "",
};
type ContactPageProps = {
  t: (key: string) => string;
};

const ContactPage: FC<ContactPageProps> = ({ t }) => {
  const { isLogined, setIsLogined, isAuthenticated } = useAuth(
    AuthenticationContext
  );
  const { formState, onInputChange, resetForm } =
    useForm<ContactFormRequest>(initialForm);
  const { nameContact, emailContact, messageContact, subjectContact } =
    formState;

  const contactService = useAuthContactService();
  const captchaService = useRacerValidateReCaptcha();

  const [showSuccessMessage, setshowSuccessMessage] = useState<boolean>(false);
  const [showContactWarning, setShowContactWarning] = useState<boolean>(false);
  const [showConnectError, setShowConnectError] = useState<boolean>(false);

  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
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

    contactService.chargeContactInOptions(formState);
    const contactResponse = await contactService.getFetch();
    if (isApiResponseError(contactResponse.data)) {
      setShowContactWarning(true);
    } else if (isValidTokenResponse(contactResponse.data)) {
      if (contactResponse.data.valid) {
        setshowSuccessMessage(true);
      } else {
        setShowContactWarning(true);
      }
    } else {
      setShowConnectError(true);
    }
    resetForm();
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
    <Container className="py-5">
      <Row className="justify-content-center">
        <Col md={8} lg={6}>
          <Card className="profile-card">
            <Card.Header className="text-center text-light">
              <p className="fs-2 fw-bold">{t("pageContactTitle")}</p>
              <hr />
              <p className="fw-medium">{t("pageContactText")}</p>
            </Card.Header>
            <Card.Body>
              <Form onSubmit={async (event) => await handleSubmit(event)}>
                {showSuccessMessage ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center">
                      <Alert
                        variant="success"
                        onClose={() => setshowSuccessMessage(false)}
                        dismissible
                      >
                        <p>{t("pageContactSuccessMessage")}</p>
                      </Alert>
                    </Form.Label>
                  </Form.Group>
                ) : null}
                {showContactWarning ? (
                  <Form.Group>
                    <Form.Label className="d-flex justify-content-center align-items-center">
                      <Alert
                        variant="warning"
                        onClose={() => setShowContactWarning(false)}
                        dismissible
                      >
                        <p>{t("pageContactError")}</p>
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
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="nameContact"
                    className="text-light fw-bold fs-6"
                  >
                    {t("pageContactName")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="nameContact"
                    name="nameContact"
                    type="text"
                    className="fw-medium"
                    placeholder={t("pageContactNameText")}
                    value={nameContact}
                    onChange={onInputChange}
                    required
                    disabled={isLogined}
                  />
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="emailContact"
                    className="text-light fw-bold fs-6"
                  >
                    {t("pageContactEmail")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="emailContact"
                    name="emailContact"
                    type="email"
                    className="fw-medium"
                    placeholder={t("pageContactEmailText")}
                    value={emailContact}
                    onChange={onInputChange}
                    required
                    disabled={isLogined}
                  />
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="subjectContact"
                    className="text-light fw-bold fs-6"
                  >
                    {t("pageContactSubject")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="subjectContact"
                    name="subjectContact"
                    type="text"
                    className="fw-medium"
                    placeholder={t("pageContactSubjectText")}
                    value={subjectContact}
                    onChange={onInputChange}
                    disabled={isLogined}
                  />
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="messageContact"
                    className="text-light fw-bold fs-6"
                  >
                    {t("pageContactMessage")}
                    <span className="text-danger fs-6">
                      <sup>*</sup>
                    </span>
                  </Form.Label>
                  <Form.Control
                    id="messageContact"
                    name="messageContact"
                    className="fw-medium"
                    as="textarea"
                    rows={4}
                    placeholder={t("pageContactMessageText")}
                    value={messageContact}
                    onChange={onInputChange}
                    required
                    disabled={isLogined}
                  />
                  <Form.Text
                    className={
                      messageContact.length > 500 ? "text-danger" : "text-light"
                    }
                  >
                    ({messageContact.length}/500)
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
                    className="w-100"
                    disabled={isLogined || captchaToken === null}
                  >
                    {t("pageContactSubmit")}
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

export default ContactPage;
