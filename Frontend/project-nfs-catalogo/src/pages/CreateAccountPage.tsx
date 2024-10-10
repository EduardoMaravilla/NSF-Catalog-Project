import { Container, Row, Col, Form, Button, Card } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { FC, useState } from "react";
import { TermsAndConditionModal } from "../components/modals-components/TermsAndConditionModal";
import { UserSaveDto } from "../types/TypeConctact";
import { useForm } from "../hooks/useForm";

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
  const [showModal, setShowModal] = useState(false);
  const [isTermsAccepted, setIsTermsAccepted] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  const { formState, onInputChange, resetForm } =
    useForm<UserSaveDto>(initialUserRegister);
  const { name, username, email, password, repeatedPassword } = formState;

  const handleCheckboxChange = () => {
    setShowModal(true);
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

  return (
    <Container className="d-flex justify-content-center align-items-center">
      <Row>
        <Col>
          <Card>
            <Card.Header className="text-center fw-bold">
              {t("createAccountTitle")}
            </Card.Header>
            <Card.Body>
              <Form>
                <Form.Group className="mb-3">
                  <Form.Label htmlFor="nameRegister" className="fw-bold">
                    {t("cAName")}
                  </Form.Label>
                  <Form.Control
                    id="nameRegister"
                    name="name"
                    type="text"
                    value={name}
                    placeholder={t("cANameText")}
                    onChange={onInputChange}
                    autoComplete="name"
                  />
                  <Form.Text className="text-muted">
                    {t("cANameMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label htmlFor="usernameRegister" className="fw-bold">
                    {t("cAUsername")}
                  </Form.Label>
                  <Form.Control
                    id="usernameRegister"
                    name="username"
                    type="text"
                    value={username}
                    placeholder={t("cAUsernameText")}
                    onChange={onInputChange}
                    autoComplete="username"
                    required
                  />
                  <Form.Text className="text-muted">
                    {t("cAUsernameMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label htmlFor="emailRegister" className="fw-bold">
                    {t("cAEmail")}
                  </Form.Label>
                  <Form.Control
                    id="emailRegister"
                    name="email"
                    type="email"
                    value={email}
                    placeholder={t("cAEmailText")}
                    onChange={onInputChange}
                    autoComplete="email"
                    required
                  />
                  <Form.Text className="text-muted">
                    {t("cAEmailMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Row className="justify-content-between align-items-center">
                    <Col>
                      <Form.Label
                        htmlFor="passwordRegister"
                        className="fw-bold"
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
                    autoComplete="new-password webauthn"
                    required
                  />
                  <Form.Text className="text-muted">
                    {t("cAPasswordMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label
                    htmlFor="repeatPasswordRegister"
                    className="fw-bold"
                  >
                    {t("cAConfirmPassword")}
                  </Form.Label>
                  <Form.Control
                    id="repeatPasswordRegister"
                    name="repeatedPassword"
                    type={showPassword ? "text" : "password"}
                    value={repeatedPassword}
                    placeholder={t("cAConfirmPasswordText")}
                    onChange={onInputChange}
                    autoComplete="new-password webauthn"
                    required
                  />
                  <Form.Text className="text-muted">
                    {t("cAConfirmPasswordMessage")}
                  </Form.Text>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Check id="checkBoxTermsAndConditions" type="checkbox">
                    <Form.Check.Input
                      type="checkbox"
                      checked={isTermsAccepted}
                      onChange={handleTermsAccepted}
                      isValid
                    />
                    <Form.Check.Label>
                      {t("cAAcceptTerms")}{" "}
                      <span
                        style={{
                          textDecoration: "underline",
                          cursor: "pointer",
                        }}
                        onClick={handleCheckboxChange}
                      >
                        {t("cAShowTerms")}
                      </span>
                    </Form.Check.Label>
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
                <Button variant="primary" type="submit">
                  {t("cAConfirmButton")}
                </Button>
              </Form>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default CreateAccountPage;
