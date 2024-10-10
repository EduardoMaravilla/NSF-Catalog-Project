import { useEffect, useState } from "react";
import { AuthenticationContext } from "./AuthenticationContext";
import {
  isApiResponseError,
  isValidTokenResponse,
} from "../../utilities/funcionExport";
import { useAuthValidTokenService } from "../../services/auth/useAuthValidTokenService";

export const AuthenticationProvider: React.FC<{
  children: React.ReactNode;
}> = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState<boolean>(false);
  const [jwtToken, setJwtToken] = useState<string>("");
  const [isLogined, setIsLogined] = useState(false);
  const { getFetch, chargeTokenInOptions } = useAuthValidTokenService();

  useEffect(() => {
      const verifyToken = async () => {
        try {
          const tokenJwt = localStorage.getItem("token-jwt-nfs-catalog-unbound");
          if (tokenJwt) {
            chargeTokenInOptions(tokenJwt);
            const state = await getFetch();
            if (isApiResponseError(state.data)) {
              clearAuthState();
            } else if (isValidTokenResponse(state.data)) {
              if (state.data.valid) {
                setIsAuthenticated(true);
                setJwtToken(tokenJwt);
              } else {
                clearAuthState();
              }
            } else {
              clearAuthState();
            }
          }
        } catch (error) {
          console.error("Error fetching token validation:", error);
          clearAuthState();
        }
      };
      verifyToken();
  },[]);// eslint-disable-line react-hooks/exhaustive-deps

  const clearAuthState = () => {
    localStorage.removeItem("token-jwt-nfs-catalog-unbound");
    localStorage.removeItem("user-profile-response");
    setIsAuthenticated(false);
    setJwtToken("");
  };
  
  
  return (
    <AuthenticationContext.Provider
      value={{
        isAuthenticated,
        setIsAuthenticated,
        jwtToken,
        setJwtToken,
        isLogined,
        setIsLogined,
      }}
    >
      {children}
    </AuthenticationContext.Provider>
  );
};
