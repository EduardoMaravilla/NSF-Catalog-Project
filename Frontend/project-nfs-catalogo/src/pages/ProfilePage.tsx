import { FC, useState } from "react";
import {
  Alert,
  Button,
  Card,
  Col,
  Container,
  Form,
  Row,
  Spinner,
} from "react-bootstrap";
import { BsPersonCircle } from "react-icons/bs";
import { useLoadProfileData } from "../context/profile-data/useLoadProfileData";
import { LoadProfileDataContext } from "../context/profile-data/LoadProfileDataContext";
import {
  NewUserProfileReponse,
  UserEditProfileRequest,
} from "../types/TypeConctact";
import { useForm } from "../hooks/useForm";
import { useRacerUpdateProfile } from "../services/racer/useRacerUpdateProfile";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import { isApiResponseError } from "../utilities/funcionExport";

type ProfilePageProps = {
  t: (key: string) => string;
};

const ProfilePage: FC<ProfilePageProps> = ({ t }) => {
  const { userProfile, setUserProfile } = useLoadProfileData(
    LoadProfileDataContext
  );
  const { jwtToken, setJwtToken, setIsLogined, isLogined } = useAuth(
    AuthenticationContext
  );
  const [editData, setEditData] = useState<boolean>(true);
  const [failEditData, setFailEditData] = useState<boolean>(false);

  const initialForm: UserEditProfileRequest = {
    nameEdit: userProfile.name,
    emailEdit: userProfile.email,
    passwordEdit: "",
    roleEdit: userProfile.role,
    usernameEdit: userProfile.username,
    colorEdit: userProfile.color,
  };
  const { formState, onInputChange, resetForm } =
    useForm<UserEditProfileRequest>(initialForm);
  const {
    nameEdit,
    emailEdit,
    passwordEdit,
    roleEdit,
    usernameEdit,
    colorEdit,
  } = formState;
  const { chargeTokenAndDataInOptions, getFetch } = useRacerUpdateProfile();
  const [showPassword, setShowPassword] = useState(false);

  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const onSubmitEditProfile = async (
    event: React.FormEvent<HTMLFormElement>
  ) => {
    event.preventDefault();
    setIsLogined(true);
    chargeTokenAndDataInOptions(jwtToken, formState);
    const state = await getFetch();
    if (isApiResponseError(state.data)) {
      setFailEditData(true);
    } else {
      const editProfileResponse = state.data as NewUserProfileReponse;
      setUserProfile(editProfileResponse.userProfileResponse);
      setJwtToken(editProfileResponse.authenticationResponse.tokenJwt);
      localStorage.setItem(
        "user-profile-response",
        JSON.stringify(editProfileResponse.userProfileResponse)
      );
      localStorage.setItem(
        "token-jwt-nfs-catalog-unbound",
        editProfileResponse.authenticationResponse.tokenJwt
      );
    }
    setEditData(true);
    setIsLogined(false);
  };

  return (
    <Container className="mt-4">
      <Row>
        <Col>
          <Card>
            <Card.Header>{t("profilePageTitle")}</Card.Header>
            <Card.Body>
              {failEditData ? (
                <Alert variant="danger" onClose={() => setFailEditData(false)}>
                  {t("profileEditError")}
                </Alert>
              ) : null}
              <Form
                onSubmit={async (event) => await onSubmitEditProfile(event)}
              >
                <Form.Group as={Row} className="my-2">
                  <Form.Label htmlFor="colorEdit" column sm={2}>
                    <BsPersonCircle
                      size={100}
                      className="mb-3"
                      style={{ color: colorEdit }}
                    />
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="colorEdit"
                      name="colorEdit"
                      type="color"
                      value={colorEdit}
                      onChange={onInputChange}
                      title="Choose your color"
                      disabled={editData}
                    />
                  </Col>
                </Form.Group>
                <Form.Group as={Row} className="my-2">
                  <Form.Label htmlFor="nameEdit" column sm={2}>
                    {t("profileName") + ":"}
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="nameEdit"
                      name="nameEdit"
                      type="text"
                      value={nameEdit}
                      onChange={onInputChange}
                      disabled={editData}
                    />
                  </Col>
                </Form.Group>
                <Form.Group as={Row} className="my-2">
                  <Form.Label htmlFor="usernameEdit" column sm={2}>
                    {t("profileUsername") + ":"}
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="usernameEdit"
                      name="usernameEdit"
                      type="text"
                      value={usernameEdit}
                      onChange={onInputChange}
                      disabled={editData}
                    />
                  </Col>
                </Form.Group>
                <Form.Group as={Row} className="my-2">
                  <Form.Label htmlFor="emailEdit" column sm={2}>
                    Email:
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="emailEdit"
                      name="emailEdit"
                      type="email"
                      value={emailEdit}
                      onChange={onInputChange}
                      disabled
                    />
                  </Col>
                </Form.Group>
                <Form.Group as={Row} className="my-2">
                  <Form.Label htmlFor="roleEdit" column sm={2}>
                    Role:
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="roleEdit"
                      name="roleEdit"
                      type="text"
                      value={roleEdit}
                      onChange={onInputChange}
                      disabled
                    />
                  </Col>
                </Form.Group>
                <Form.Group
                  as={Row}
                  className="my-2"
                  style={{ display: editData ? "none" : "flex" }}
                >
                  <Form.Label htmlFor="passwordEdit" column sm={2}>
                    {t("profilePassword") + ":"}
                  </Form.Label>
                  <Col sm={10}>
                    <Form.Control
                      id="passwordEdit"
                      name="passwordEdit"
                      type={showPassword ? "text" : "password"}
                      value={passwordEdit}
                      onChange={onInputChange}
                      required
                      disabled={editData}
                    />
                    <Form.Check
                      id="showPassword"
                      name="showPassword"
                      className="fs-6"
                      label={t("showPassword")}
                      type="checkbox"
                      checked={showPassword}
                      disabled={isLogined}
                      onChange={isPasswordVisibility}
                    />
                  </Col>
                </Form.Group>
                {isLogined ? (
                  <Form.Group>
                    <Form.Label
                      htmlFor="password"
                      className="d-flex justify-content-center align-items-center"
                    >
                      <Spinner animation="border" variant="primary" />
                    </Form.Label>
                  </Form.Group>
                ) : (
                  <>
                    <Button
                      className="mx-2 "
                      variant="info"
                      onClick={() => {
                        setEditData(!editData);
                        resetForm();
                      }}
                    >
                      {editData ? t("editButton") : t("dontEditButton")}
                    </Button>
                    <Button variant="success" type="submit" disabled={editData}>
                      {t("saveButton")}
                    </Button>
                  </>
                )}
              </Form>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
};

export default ProfilePage;
