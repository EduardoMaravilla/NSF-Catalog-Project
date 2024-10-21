import React, { FC, useRef, useState } from "react";
import {
  Alert,
  Button,
  Card,
  Col,
  Form,
  Row,
} from "react-bootstrap";
import { BsPersonCircle } from "react-icons/bs";
import { useLoadProfileData } from "../context/profile-data/useLoadProfileData";
import { LoadProfileDataContext } from "../context/profile-data/LoadProfileDataContext";
import {
  NewUpdatePasswordRequest,
  NewUserProfileReponse,
  UserEditProfileRequest,
} from "../types/TypeConctact";
import { useForm } from "../hooks/useForm";
import { useRacerUpdateProfile } from "../services/racer/useRacerUpdateProfile";
import { useAuth } from "../context/auth/useAuth";
import { AuthenticationContext } from "../context/auth/AuthenticationContext";
import {
  isApiResponseError,
  isNewUserProfileResponse,
  isValidPassword,
} from "../utilities/funcionExport";
import HReCaptchaComponent from "../components/utils/HReCaptchaComponent";
import { useRacerValidateReCaptcha } from "../services/racer/useRacerValidateReCaptcha";
import { ValidTokenResponse } from "../types/TypesUserLogin";
import HCaptcha from "@hcaptcha/react-hcaptcha";
import SpinnerComponent from "../components/utils/SpinnerComponent";
import { useRacerProfileUpdatePassword } from "../services/racer/useRacerProfileUpdatePassword";

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
  const [showConnectError, setShowConnectError] = useState<boolean>(false);
  const [editData, setEditData] = useState<boolean>(false);
  const [editNewPassword, setEditNewPassword] = useState<boolean>(false);
  const [failEditData, setFailEditData] = useState<boolean>(false);

  const initialFormProfile: UserEditProfileRequest = {
    nameEdit: userProfile.name,
    emailEdit: userProfile.email,
    passwordEdit: "",
    roleEdit: userProfile.role,
    usernameEdit: userProfile.username,
    colorEdit: userProfile.color,
  };

  const initialFormPassword: NewUpdatePasswordRequest = {
    currentPassword: "",
    newPassword: "",
    confirmNewPassword: "",
  };

  const profileForm = useForm<UserEditProfileRequest>(initialFormProfile);
  const passwordform = useForm<NewUpdatePasswordRequest>(initialFormPassword);

  const {
    nameEdit,
    emailEdit,
    passwordEdit,
    roleEdit,
    usernameEdit,
    colorEdit,
  } = profileForm.formState;
  const { currentPassword, newPassword, confirmNewPassword } =
    passwordform.formState;
  const [captchaToken, setCaptchaToken] = useState<string | null>(null);
  const captchaRef = useRef<HCaptcha | null>(null);

  const [failEditNewPassword, setFailEditNewPassword] =
    useState<boolean>(false);
  const [failNewPassword, setFailNewPassword] = useState<boolean>(false);
  const [failNewConfirmPassword, setFailNewConfirmPassword] =
    useState<boolean>(false);

  const updateProfileService = useRacerUpdateProfile();
  const captchaService = useRacerValidateReCaptcha();
  const updatePasswordService = useRacerProfileUpdatePassword();

  const [showPassword, setShowPassword] = useState(false);
  const [showNewPassword, setShowNewPassword] = useState(false);

  const [dataEditSuccesfully, setDataEditSuccesfully] =
    useState<boolean>(false);
  const [passwordChangeSuccesfully, setPasswordChangeSuccesfully] =
    useState<boolean>(false);

  const isPasswordVisibility = () => {
    setShowPassword(!showPassword);
  };

  const isNewPasswordVisibility = () => {
    setShowNewPassword(!showNewPassword);
  };

  const onSubmitEditProfile = async (
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

    updateProfileService.chargeTokenAndDataInOptions(
      jwtToken,
      profileForm.formState
    );
    const state = await updateProfileService.getFetch();
    console.log(state);
    if (isApiResponseError(state.data)) {
      setFailEditData(true);
      setCaptchaToken(null);
    } else if (isNewUserProfileResponse(state.data)) {
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
      setDataEditSuccesfully(true);
    } else {
      setShowConnectError(true);
    }
    setCaptchaToken(null);
    setEditData(false);
    setIsLogined(false);
  };

  const onSubmitEditPassword = async (
    event: React.FormEvent<HTMLFormElement>
  ) => {
    event.preventDefault();
    setIsLogined(true);

    const count = verifyPassword(passwordform.formState);
    if (count > 0) {
      setIsLogined(false);
      return;
    }

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

    updatePasswordService.chargeTokenAndDataInOptions(
      jwtToken,
      passwordform.formState
    );
    const state = await updatePasswordService.getFetch();
    console.log(state);
    if (isApiResponseError(state.data)) {
      setFailEditNewPassword(true);
      setCaptchaToken(null);
    } else if (isNewUserProfileResponse(state.data)) {
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
      setPasswordChangeSuccesfully(true);
    } else {
      setShowConnectError(true);
    }
    passwordform.resetForm();
    setEditNewPassword(false);
    setCaptchaToken(null);
    setIsLogined(false);
  };

  const verifyPassword = (password: NewUpdatePasswordRequest) => {
    let count = 0;
    if (!(password.newPassword === password.confirmNewPassword)) {
      setFailNewConfirmPassword(true);
      count++;
    } else {
      setFailNewConfirmPassword(false);
    }
    if (!isValidPassword(password.newPassword)) {
      setFailNewPassword(true);
      count++;
    } else {
      setFailNewPassword(false);
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
    <>
      <Card className="my-3 profile-card text-light fw-medium border border-primary">
        <Card.Header className="fw-bold fs-4">
          {t("profilePageTitle")}
        </Card.Header>
        <Card.Body>
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
          {failEditData ? (
            <Alert
              variant="danger"
              onClose={() => setFailEditData(false)}
              dismissible
            >
              {t("profileEditError")}
            </Alert>
          ) : null}
          {dataEditSuccesfully ? (
            <Alert
              variant="success"
              onClose={() => setDataEditSuccesfully(false)}
              dismissible
            >
              {t("profileChangeEditSuccess")}
            </Alert>
          ) : null}
          <Form onSubmit={async (event) => await onSubmitEditProfile(event)}>
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
                  className={`bg-dark text-light fw-medium ${!editData ? 'disabled-custom' : ''}`}
                  value={colorEdit}
                  onChange={profileForm.onInputChange}
                  title="Choose your color"
                  disabled={!editData}
                />
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="nameEdit" className="fs-5" column sm={2}>
                {t("profileName") + ":"}
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="nameEdit"
                  name="nameEdit"
                  type="text"
                  className={`bg-dark text-light fw-medium ${!editData ? 'disabled-custom' : ''}`}
                  value={nameEdit}
                  onChange={profileForm.onInputChange}
                  disabled={!editData}
                />
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="usernameEdit" className="fs-5" column sm={2}>
                {t("profileUsername") + ":"}
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="usernameEdit"
                  name="usernameEdit"
                  type="text"
                  className={`bg-dark text-light fw-medium ${!editData ? 'disabled-custom' : ''}`}
                  value={usernameEdit}
                  onChange={profileForm.onInputChange}
                  disabled={!editData}
                />
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="emailEdit" className="fs-5" column sm={2}>
                Email:
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="emailEdit"
                  name="emailEdit"
                  type="email"
                  className="bg-dark text-light fw-medium disabled-custom"
                  value={emailEdit}
                  onChange={profileForm.onInputChange}
                  disabled
                />
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="roleEdit" className="fs-5" column sm={2}>
                Role:
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="roleEdit"
                  name="roleEdit"
                  type="text"
                  className="bg-dark text-light fw-medium disabled-custom"
                  value={roleEdit}
                  onChange={profileForm.onInputChange}
                  disabled
                />
              </Col>
            </Form.Group>
            {editData ? (
              <Form.Group as={Row} className="my-2">
                <Form.Label htmlFor="passwordEdit" className="fs-5" column sm={2}>
                  {t("profilePassword") + ":"}
                </Form.Label>
                <Col sm={10}>
                  <Form.Control
                    id="passwordEdit"
                    name="passwordEdit"
                    className="bg-dark text-light fw-medium"
                    type={showPassword ? "text" : "password"}
                    value={passwordEdit}
                    onChange={profileForm.onInputChange}
                    required
                    disabled={!editData}
                  />
                  <Form.Check
                    id="showPassword"
                    name="showPassword"
                    className="fs-6 my-2"
                    label={t("showPassword")}
                    type="checkbox"
                    checked={showPassword}
                    disabled={isLogined || !editData}
                    onChange={isPasswordVisibility}
                  />
                  <HReCaptchaComponent onVerify={onVerifyCaptcha} />
                </Col>
              </Form.Group>
            ) : null}
            {isLogined ? (
              <SpinnerComponent />
            ) : (
              <>
                <Button
                  className="mx-2 fs-5 text-light"
                  variant="info"
                  onClick={() => {
                    setEditData(!editData);
                    setShowPassword(false);
                    profileForm.resetForm();
                    if (editNewPassword) {
                      setEditNewPassword(false);
                      setShowNewPassword(false);
                      passwordform.resetForm();
                    }
                  }}
                >
                  {editData ? t("dontEditButton") : t("editButton")}
                </Button>
                <Button
                  variant="success"
                  type="submit"
                  className="fs-5 text-light"
                  disabled={!editData || captchaToken === null}
                >
                  {t("saveButton")}
                </Button>
              </>
            )}
          </Form>
        </Card.Body>
      </Card>
      {/*Form Reset Password */}
      <Card className="my-3 profile-card text-light fw-medium border border-primary">
        <Card.Header className="fw-bold fs-4">
          {t("profileChangePassword")}
        </Card.Header>
        <Card.Body>
          {failEditNewPassword ? (
            <Alert
              variant="danger"
              onClose={() => setFailEditNewPassword(false)}
              dismissible
            >
              {t("profileEditErrorPassword")}
            </Alert>
          ) : null}
          {passwordChangeSuccesfully ? (
            <Alert
              variant="success"
              onClose={() => setPasswordChangeSuccesfully(false)}
              dismissible
            >
              {t("profilePasswordChangeSuccess")}
            </Alert>
          ) : null}
          <Form onSubmit={async (event) => await onSubmitEditPassword(event)}>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="currentPassword" className="fs-5" column sm={2}>
                {t("profileCurrentPassword") + ":"}
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="currentPassword"
                  name="currentPassword"
                  type={showNewPassword ? "text" : "password"}
                  value={currentPassword}
                  className={`bg-dark text-light fw-medium ${!editNewPassword? 'disabled-custom' : ''}`}
                  onChange={passwordform.onInputChange}
                  required
                  disabled={isLogined || !editNewPassword}
                />
                <Form.Check
                  id="showNewPassword"
                  name="showNewPassword"
                  className="fs-6 my-2"
                  label={t("showPassword")}
                  type="checkbox"
                  checked={showNewPassword}
                  onChange={isNewPasswordVisibility}
                  disabled={isLogined || !editNewPassword}
                />
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="newPassword" className="fs-5" column sm={2}>
                {t("profileNewPassword") + ":"}
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="newPassword"
                  name="newPassword"
                  className={`bg-dark text-light fw-medium ${!editNewPassword? 'disabled-custom' : ''}`}
                  type={showNewPassword ? "text" : "password"}
                  value={newPassword}
                  onChange={passwordform.onInputChange}
                  required
                  disabled={!editNewPassword}
                />
                <Form.Text
                  className={failNewPassword ? "text-danger" : "text-secondary"}
                >
                  {t("cAPasswordMessage")}
                </Form.Text>
              </Col>
            </Form.Group>
            <Form.Group as={Row} className="my-2">
              <Form.Label htmlFor="confirmNewPassword" className="fs-5" column sm={2}>
                {t("profileNewConfirmPassword") + ":"}
              </Form.Label>
              <Col sm={10}>
                <Form.Control
                  id="confirmNewPassword"
                  name="confirmNewPassword"
                  className={`bg-dark text-light fw-medium ${!editNewPassword? 'disabled-custom' : ''}`}
                  type={showNewPassword ? "text" : "password"}
                  value={confirmNewPassword}
                  onChange={passwordform.onInputChange}
                  required
                  disabled={!editNewPassword}
                />
                <Form.Text
                  className={
                    failNewConfirmPassword ? "text-danger" : "text-secondary"
                  }
                >
                  {t("cAConfirmPasswordMessage")}
                </Form.Text>
                {editNewPassword ? (
                  <HReCaptchaComponent onVerify={onVerifyCaptcha} />
                ) : null}
              </Col>
            </Form.Group>
            {isLogined ? (
              <SpinnerComponent />
            ) : (
              <>
                <Button
                  variant="info"
                  className="mx-2"
                  onClick={() => {
                    setEditNewPassword(!editNewPassword);
                    setShowNewPassword(false);
                    setFailNewPassword(false);
                    setFailNewConfirmPassword(false);
                    passwordform.resetForm();
                    if (editData) {
                      setEditData(false);
                      profileForm.resetForm();
                    }
                  }}
                >
                  {editNewPassword
                    ? t("profileButtonCancel")
                    : t("profileButtonChangePassword")}
                </Button>
                <Button
                  variant="success"
                  type="submit"
                  disabled={!editNewPassword || captchaToken === null}
                >
                  {t("saveButton")}
                </Button>
              </>
            )}
          </Form>
        </Card.Body>
      </Card>
    </>
  );
};

export default ProfilePage;
