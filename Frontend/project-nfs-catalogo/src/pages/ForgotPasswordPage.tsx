import {
  Container,
  Row,
  Col,
  Form,
  Button,
  Card,
  Alert,
} from "react-bootstrap";
import { FC, useState } from "react";
import { useForm } from "../hooks/useForm";
import { isApiResponseError, isValidEmail } from "../utilities/funcionExport";
import { useRacerResetPassword } from "../services/racer/useRacerResetPassword";

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
  const { formState, onInputChange, resetForm } = useForm(initialForm);
  const { emailReset } = formState;
  const {chargeEmailInOptions,getFetch} = useRacerResetPassword();

  const onResetPassword = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if(!isValidEmail(emailReset)){
       setEmailFail(true);
       return;
    }
    chargeEmailInOptions(emailReset);
    const state = await getFetch();
    if (isApiResponseError(state.data)) {
         setFailSendEmail(true);
    }else {
       setSuccessRegister(true);
       resetForm();
    }
  }

  return (
    <Container>
      <Row>
        <Col>
          <Card>
            <Card.Header className="text-center fw-bold fs-2">
              {t("forgotPasswordTitle")}
            </Card.Header>
            <Card.Body>
              <Form onSubmit={async (event) => await onResetPassword(event) }>
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
                  <Form.Label htmlFor="emailReset" className="fw-bold">
                    {t("cAEmail")}
                  </Form.Label>
                  <Form.Control
                    id="emailReset"
                    name="emailReset"
                    value={emailReset}
                    type="email"
                    placeholder={t("cAEmailText")}
                    onChange={onInputChange}
                    required
                    autoComplete="off"
                  />
                  <Form.Text className="text-muted">
                    {t("forgotPasswordText")}
                  </Form.Text>
                </Form.Group>
                <Button variant="primary" type="submit" className="w-100 mt-3">
                  {t("forgotPasswordButton")}
                </Button>
              </Form>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ForgotPasswordPage;
