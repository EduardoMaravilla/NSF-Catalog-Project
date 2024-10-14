package org.eduardomaravill.nfs_catalogo.controllers.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.NewUserProfileResponse;
import org.eduardomaravill.nfs_catalogo.dtos.auth.UserEditProfileRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UpdatePasswordRequest;
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

import java.util.Map;

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
    public ResponseEntity<ValidTokenResponse> registerOneRacer(@RequestBody UserSaveDto newUser){
        ValidTokenResponse validTokenResponse = authenticationService.registerOneRacer(newUser);
        return ResponseEntity.status(HttpStatus.CREATED).body(validTokenResponse);
    }

    @PostMapping("/update-profile")
    public ResponseEntity<NewUserProfileResponse> updateProfile(HttpServletRequest request, @RequestBody UserEditProfileRequest userEditProfileRequest){
        NewUserProfileResponse newUserProfileResponse = authenticationService.updateProfileOneRacer(request,userEditProfileRequest);
        return ResponseEntity.ok(newUserProfileResponse);
    }

    @PostMapping("/profile-verified")
    public ResponseEntity<NewUserProfileResponse> updateProfileVerifier(HttpServletRequest request){
        NewUserProfileResponse newUserProfileResponse = authenticationService.updateEmailVerified(request);
        return ResponseEntity.ok(newUserProfileResponse);
    }

    @PostMapping("/reset-password")
    public ResponseEntity<ValidTokenResponse> resetPassword(@RequestBody Map<String, String> requestBody){
        String email = requestBody.get("email");
        ValidTokenResponse validTokenResponse = authenticationService.resetPassword(email);
        return ResponseEntity.ok(validTokenResponse);
    }

    @PostMapping("/update-password")
    public ResponseEntity<ValidTokenResponse> updatePassword(HttpServletRequest request,@RequestBody UpdatePasswordRequest updatePasswordRequest){
        ValidTokenResponse validTokenResponse = authenticationService.updatePassword(request, updatePasswordRequest);
        return ResponseEntity.ok(validTokenResponse);
    }

    @PostMapping("/verify-recaptcha-token")
    public ResponseEntity<ValidTokenResponse> verifyReCaptchaToken(@RequestBody Map<String, String> requestBody){
        String token = requestBody.get("token");
        ValidTokenResponse response = authenticationService.verifyReCaptchaToken(token);
        return ResponseEntity.ok(response);
    }

}
