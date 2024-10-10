package org.eduardomaravill.nfs_catalogo.services.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.*;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserRegistered;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;

public interface IAuthenticationService {
    UserRegistered registerOneRacer(UserSaveDto newUser);
    AuthenticationResponse login(AuthenticationRequest autRequest);
    Boolean validateToken(HttpServletRequest request);
    UserProfileResponse findLoggedInUser();
    void logout(HttpServletRequest request);

    NewUserProfileResponse updateProfileOneRacer(HttpServletRequest request,UserEditProfileRequest userEditProfileRequest);
}
