package org.eduardomaravill.nfs_catalogo.services.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.*;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UpdatePasswordRequest;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;


public interface IAuthenticationService {
    ValidTokenResponse registerOneRacer(UserSaveDto newUser);
    AuthenticationResponse login(AuthenticationRequest autRequest);
    Boolean validateToken(HttpServletRequest request);
    UserProfileResponse findLoggedInUser();
    void logout(HttpServletRequest request);
    NewUserProfileResponse updateProfileOneRacer(HttpServletRequest request,UserEditProfileRequest userEditProfileRequest);
    NewUserProfileResponse updateEmailVerified(HttpServletRequest request);
    ValidTokenResponse resetPassword(String email);
    ValidTokenResponse updatePassword(HttpServletRequest request, UpdatePasswordRequest updatePasswordRequest);
    ValidTokenResponse verifyReCaptchaToken(String token);
}
