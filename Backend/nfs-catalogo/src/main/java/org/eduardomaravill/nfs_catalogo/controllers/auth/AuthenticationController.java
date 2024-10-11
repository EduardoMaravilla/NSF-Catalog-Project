package org.eduardomaravill.nfs_catalogo.controllers.auth;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.AuthenticationRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.AuthenticationResponse;
import org.eduardomaravill.nfs_catalogo.dtos.auth.UserProfileResponse;
import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.LogoutResponse;
import org.eduardomaravill.nfs_catalogo.services.auth.IAuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin
@Validated
public class AuthenticationController {

    private final IAuthenticationService authenticationService;


    @Autowired
    public AuthenticationController(IAuthenticationService authenticationService){
        this.authenticationService = authenticationService;
    }

    @PostMapping("/validate-token")
    public ResponseEntity<ValidTokenResponse> validateToken(HttpServletRequest request){
        ValidTokenResponse vTR = new ValidTokenResponse(authenticationService.validateToken(request));
        return ResponseEntity.ok(vTR);
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest authenticationRequest){

        AuthenticationResponse rsp = authenticationService.login(authenticationRequest);
        return ResponseEntity.ok(rsp);
    }

    @PostMapping("/logout")
    public ResponseEntity<LogoutResponse> logout(HttpServletRequest request){
        authenticationService.logout(request);
        return ResponseEntity.ok(new LogoutResponse("Logout exitoso"));
    }
    @GetMapping("/profile")
    public ResponseEntity<UserProfileResponse> findMyProfile(){
        UserProfileResponse user = authenticationService.findLoggedInUser();
        return ResponseEntity.ok(user);
    }

}
