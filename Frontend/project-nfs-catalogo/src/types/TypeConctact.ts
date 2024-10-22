import { CarConfigurationDto } from "./TypeCars";
import { AuthenticationResponse } from "./TypesUserLogin";


export interface UserProfileContext {
  userProfile: UserProfileResponse;
  setUserProfile: (userProfile: UserProfileResponse) => void;
}

export interface UserProfileResponse {
  name: string;
  username: string;
  email: string;
  role: string;
  color: string;
}

export interface UserEditProfileRequest {
  nameEdit: string;
  usernameEdit: string;
  emailEdit: string;
  roleEdit: string;
  passwordEdit: string;
  colorEdit: string;
}

export interface NewUserProfileReponse {
  userProfileResponse: UserProfileResponse;
  authenticationResponse: AuthenticationResponse;
}

export interface CarConfigRequest {
  userProfile: UserProfileResponse;
  carConfigDto: CarConfigurationDto;
}

export interface UserSaveDto {
  name: string;
  username: string;
  email: string;
  password: string;
  repeatedPassword: string;
}

export interface UpdatePasswordRequest {
  password: string;
  confirmPassword: string;
}

export interface NewUpdatePasswordRequest {
  currentPassword: string;
  newPassword: string;
  confirmNewPassword: string;
}

export interface ContactFormRequest {
  nameContact: string;
  emailContact: string;
  subjectContact: string;
  messageContact: string;
}
