package org.eduardomaravill.nfs_catalogo.controllers.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.NewUserProfileResponse;
import org.eduardomaravill.nfs_catalogo.dtos.auth.UserEditProfileRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.UserProfileResponse;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserRegistered;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.services.auth.IAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/racers")
@Validated
public class RacerController {

    private final IAuthenticationService authenticationService;

    @Autowired
    public RacerController(IAuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @PostMapping("/register")
    public ResponseEntity<UserRegistered> registerOneRacer(@RequestBody UserSaveDto newUser){
        UserRegistered userRegistered = authenticationService.registerOneRacer(newUser);
        return ResponseEntity.status(HttpStatus.CREATED).body(userRegistered);
    }

    @PostMapping("/update-profile")
    public ResponseEntity<NewUserProfileResponse> updateProfile(HttpServletRequest request, @RequestBody UserEditProfileRequest userEditProfileRequest){
        NewUserProfileResponse newUserProfileResponse = authenticationService.updateProfileOneRacer(request,userEditProfileRequest);
        return ResponseEntity.ok(newUserProfileResponse);
    }
}
