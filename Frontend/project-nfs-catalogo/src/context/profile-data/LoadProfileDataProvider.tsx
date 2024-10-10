import { FC, useEffect, useState } from "react";
import { LoadProfileDataContext } from "./LoadProfileDataContext";
import { UserProfileResponse } from "../../types/TypeConctact";
import { useAuth } from "../auth/useAuth";
import { AuthenticationContext } from "../auth/AuthenticationContext";
import { useAuthProfileService } from "../../services/auth/useAuthProfileService";
import { isApiResponseError, isUserProfileResponse, loadDataFromLocalStorage } from "../../utilities/funcionExport";

const initialProfile: UserProfileResponse = {
  name: "",
  email: "",
  role: "",
  username: "",
  color: "",
};

export const LoadProfileDataProvider: FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [userProfile, setUserProfile] =
    useState<UserProfileResponse>(initialProfile);
  const { jwtToken } = useAuth(AuthenticationContext);
  const { chargeTokenInOptions, getFetch } = useAuthProfileService();

  useEffect(() => {
    const getUserProfile = async () => {
      const userProfile = loadDataFromLocalStorage<UserProfileResponse>("user-profile-response");
      if (userProfile) {
        setUserProfile(userProfile);
      } else {
        if (jwtToken) {
          chargeTokenInOptions(jwtToken);
          const response = await getFetch();
          if(isApiResponseError(response.data)){
             console.log(response.data);
             setUserProfile(initialProfile);
          }else if (isUserProfileResponse(response.data)){
              setUserProfile(response.data);
              localStorage.setItem("user-profile-response", JSON.stringify(response.data));
          }else {
            console.error("Error al cargar el usuario:", response.data);
            setUserProfile(initialProfile);
          }
        }
      }
    };
    getUserProfile();
  }, [jwtToken]); // eslint-disable-line react-hooks/exhaustive-deps

  return (
    <LoadProfileDataContext.Provider value={{ userProfile, setUserProfile }}>
      {children}
    </LoadProfileDataContext.Provider>
  );
};
