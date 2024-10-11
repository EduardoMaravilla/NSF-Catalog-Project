import { UserProfileResponse } from "../types/TypeConctact";
import { ApiResponseError } from "../types/TypesErrors";
import {
  AuthenticationResponse,
  LogoutResponse,
  ValidTokenResponse,
} from "../types/TypesUserLogin";

export function isApiResponseError(data: unknown): data is ApiResponseError {
  if (typeof data === "object" && data !== null) {
    const error = data as ApiResponseError;

    return (
      typeof error.backendMessage === "string" &&
      typeof error.message === "string" &&
      typeof error.url === "string" &&
      typeof error.method === "string" &&
      typeof error.timesTamp === "string"
    );
  }
  return false;
}

export function isAuthenticationResponse(
  data: unknown
): data is AuthenticationResponse {
  if (typeof data === "object" && data !== null) {
    const response = data as AuthenticationResponse;
    return typeof response.tokenJwt === "string";
  }
  return false;
}

export function isLogoutResponse(data: unknown): data is LogoutResponse {
  if (typeof data === "object" && data !== null) {
    const response = data as LogoutResponse;
    return typeof response.message === "string";
  }
  return false;
}

export function isValidTokenResponse(
  data: unknown
): data is ValidTokenResponse {
  if (typeof data === "object" && data !== null) {
    const response = data as ValidTokenResponse;
    return typeof response.valid === "boolean";
  }
  return false;
}

export function isUserProfileResponse(
  data: unknown
): data is UserProfileResponse {
  if (typeof data === "object" && data !== null) {
    const response = data as UserProfileResponse;
    return (
      typeof response.name === "string" &&
      typeof response.username === "string" &&
      typeof response.email === "string" &&
      typeof response.role === "string"
    );
  }
  return false;
}

export function loadDataFromLocalStorage<T>(key: string): T | null {
  const savedData = localStorage.getItem(key);
  return savedData ? JSON.parse(savedData) : null;
}

export function getColorLevel(level: number) {
  switch (level) {
    case 1:
      return "#F7C614";
    case 2:
      return "#F6941D";
    case 3:
      return "#A2CD59";
    case 4:
      return "#FF1D25";
    case 5:
      return "#662D91";
    default:
      return "white";
  }
}

export function isValidStringLength(input: string): boolean {
  return input.length >= 5 && input.length <= 50;
}

export function isValidEmail(email: string): boolean {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

export function isValidPassword(password: string): boolean {
  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*-])[A-Za-z\d!@#$%^&*-]{8,}$/;
  return passwordRegex.test(password);
}