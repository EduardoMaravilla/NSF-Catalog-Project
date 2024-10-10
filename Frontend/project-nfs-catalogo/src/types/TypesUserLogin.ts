export interface AuthenticationRequest {
    usernameOrEmail: string;
    password: string;
}

export interface AuthenticationResponse {
    tokenJwt: string;
}
export interface LogoutResponse {
    message: string;
}

export interface ValidTokenResponse {
    valid: boolean;
}

export interface AuthContextType {
    isAuthenticated: boolean;
    setIsAuthenticated: (value: boolean) => void;
    jwtToken: string;
    setJwtToken: (value: string) => void;
    isLogined: boolean;
    setIsLogined: (value: boolean) => void;
}