package org.eduardomaravill.nfs_catalogo.services.auth.implement;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.eduardomaravill.nfs_catalogo.dtos.auth.*;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.NewUpdatePasswordRequest;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UpdatePasswordRequest;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.exceptions.ObjectNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.UsernameOrEmailDuplicateException;
import org.eduardomaravill.nfs_catalogo.models.users_models.JwtToken;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.repositories.users_respositories.IJwtTokenRepository;
import org.eduardomaravill.nfs_catalogo.services.auth.IAuthenticationService;
import org.eduardomaravill.nfs_catalogo.services.auth.IJwtService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IEmailService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IReCaptchaService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.regex.Pattern;

@Service
public class AuthenticationServiceImpl implements IAuthenticationService {

    private static final String EMAIL_REGEX = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@[a-zA-Z0-9-]+\\.[a-zA-Z]{2,7}$";

    private static final String ERROR_MESSAGE = "Username, email or password Incorrect!";

    private final IUserService userService;

    private final IJwtService jwtService;

    private final IJwtTokenRepository jwtTokenRepository;

    private final AuthenticationManager authenticationManager;

    private final IEmailService emailService;

    private final IReCaptchaService reCaptchaService;


    @Autowired
    public AuthenticationServiceImpl(IUserService userService, IJwtService jwtService, IJwtTokenRepository jwtTokenRepository, AuthenticationManager authenticationManager, IEmailService emailService, IReCaptchaService reCaptchaService) {
        this.userService = userService;
        this.jwtService = jwtService;
        this.jwtTokenRepository = jwtTokenRepository;
        this.authenticationManager = authenticationManager;
        this.emailService = emailService;
        this.reCaptchaService = reCaptchaService;
    }

    @Override
    public ValidTokenResponse registerOneRacer(UserSaveDto newUser) {
        User registeredUser = userService.registerOneRacer(newUser);
        String jwtToken = jwtService.generateTokenEmailValidate(registeredUser, generateExtraClaimsForEmail(registeredUser.getEmail()));
        saveUserAndToken(registeredUser, jwtToken);
        emailService.sendEmailVerification(registeredUser,jwtToken);
        return new ValidTokenResponse(true);
    }

    private void saveUserAndToken(User registeredUser, String jwtToken) {
        JwtToken token = new JwtToken();
        token.setToken(jwtToken);
        token.setUser(registeredUser);
        token.setExpiration(jwtService.extractExpiration(jwtToken));
        token.setIsValid(true);
        jwtTokenRepository.save(token);
    }

    private Map<String, Object> generateExtraClaims(User registeredUser) {
        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("name", registeredUser.getName());
        extraClaims.put("username", registeredUser.getUsername());
        extraClaims.put("email", registeredUser.getEmail());
        extraClaims.put("role", registeredUser.getRole().getName());
        extraClaims.put("registerTime", System.currentTimeMillis());
        return extraClaims;
    }

    private Map<String, Object> generateExtraClaimsForEmail(String email) {
        Map<String, Object> extraClaims = new HashMap<>();
        extraClaims.put("email", email);
        extraClaims.put("registerTime", System.currentTimeMillis());
        return extraClaims;
    }

    @Override
    public AuthenticationResponse login(AuthenticationRequest autRequest) {
        String usernameOrEmail = autRequest.getUsernameOrEmail();
        User user;
        if (isValidEmail(usernameOrEmail)) {
            user = userService.findOneByEmail(usernameOrEmail).orElseThrow(
                    () -> new ObjectNotFoundException(ERROR_MESSAGE)
            );
        } else {
            user = userService.findOneByUsername(usernameOrEmail).orElseThrow(
                    () -> new ObjectNotFoundException(ERROR_MESSAGE)
            );
        }
        Authentication authentication = new UsernamePasswordAuthenticationToken(
                user.getUsername(), autRequest.getPassword()
        );
        authenticationManager.authenticate(authentication);

        if (!user.isEmailValid()){
            String tokenEmail = jwtService.generateTokenEmailValidate(user, generateExtraClaimsForEmail(user.getEmail()));
            saveUserAndToken(user, tokenEmail);
            emailService.sendEmailVerification(user,tokenEmail);
            throw new AccessDeniedException("Email not validated!");
        }
        String jwtToken = jwtService.generateToken(user, generateExtraClaims(user));
        saveUserAndToken(user, jwtToken);

        return new AuthenticationResponse(jwtToken);
    }

    private boolean isValidEmail(String email) {
        Pattern pattern = Pattern.compile(EMAIL_REGEX);
        return pattern.matcher(email).matches();
    }


    @Override
    public Boolean validateToken(HttpServletRequest request) {
        String jwtToken = jwtService.extractJwtFromRequest(request);
        Optional<JwtToken> jwtTokenVerify = jwtTokenRepository.findByToken(jwtToken);
        return jwtTokenVerify.isPresent() && Boolean.TRUE.equals(jwtTokenVerify.get().getIsValid()) && jwtTokenVerify.get().getExpiration().isAfter(LocalDateTime.now());
    }

    @Override
    public UserProfileResponse findLoggedInUser() {
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        String username = (String) auth.getPrincipal();
        User user = userService.findOneByUsername(username).orElseThrow(() -> new ObjectNotFoundException(ERROR_MESSAGE));
        UserProfileResponse userProfileResponse = new UserProfileResponse();
        userProfileResponse.setName(user.getName());
        userProfileResponse.setUsername(user.getUsername());
        userProfileResponse.setEmail(user.getEmail());
        userProfileResponse.setRole(user.getRole().getName());
        userProfileResponse.setColor(user.getColorProfile());
        return userProfileResponse;
    }

    @Override
    public void logout(HttpServletRequest request) {
        String jwtToken = jwtService.extractJwtFromRequest(request);
        if (!StringUtils.hasText(jwtToken)) return;
        invalidTokenJwt(jwtToken);
    }

    private void invalidTokenJwt(String jwtToken) {
        Optional<JwtToken> token = jwtTokenRepository.findByToken(jwtToken);
        boolean isValid = false;
        if (token.isPresent()) {
            isValid = token.get().getIsValid();
        }
        if (isValid) {
            token.get().setIsValid(false);
            token.get().setExpiration(LocalDateTime.now());
            jwtTokenRepository.save(token.get());
        }
    }

    @Override
    public NewUserProfileResponse updateProfileOneRacer(HttpServletRequest request, UserEditProfileRequest userEditProfileRequest) {

        AuthenticationRequest authenticationRequest = new AuthenticationRequest(userEditProfileRequest.getEmailEdit(), userEditProfileRequest.getPasswordEdit());
        AuthenticationResponse authenticationResponse = login(authenticationRequest);
        invalidTokenJwt(authenticationResponse.getTokenJwt());

        User user = userService.findOneByEmail(userEditProfileRequest.getEmailEdit())
                .orElseThrow(() -> new ObjectNotFoundException(ERROR_MESSAGE));

        if (!user.getUsername().equals(userEditProfileRequest.getUsernameEdit()) && userService.findOneByUsername(userEditProfileRequest.getUsernameEdit()).isPresent()) {
            throw new UsernameOrEmailDuplicateException("User already exists");
        }
        logout(request);
        if (!user.getRole().getName().equals(userEditProfileRequest.getRoleEdit()) ||
                !user.getEmail().equals(userEditProfileRequest.getEmailEdit())) {
            throw new AccessDeniedException("You don't have permission to modify email or role");
        }
        user.setName(userEditProfileRequest.getNameEdit());
        user.setUsername(userEditProfileRequest.getUsernameEdit());
        user.setColorProfile(userEditProfileRequest.getColorEdit());

        Optional<User> userUpdated = userService.updateUser(user);
        if (userUpdated.isPresent()) {
            authenticationRequest.setUsernameOrEmail(user.getUsername());
            authenticationRequest.setPassword(userEditProfileRequest.getPasswordEdit());
            authenticationResponse = login(authenticationRequest);

            User newUser = userUpdated.get();
            UserProfileResponse userProfileResponse = new UserProfileResponse(
                    newUser.getName(), newUser.getUsername(), newUser.getEmail(), newUser.getRole().getName(), newUser.getColorProfile()
            );
            return new NewUserProfileResponse(userProfileResponse, authenticationResponse);
        }

        return null;
    }

    @Override
    public NewUserProfileResponse updateEmailVerified(HttpServletRequest request) {
        Boolean isValidToken = validateToken(request);
        if (Boolean.FALSE.equals(isValidToken)) {
            throw new AccessDeniedException("Invalid token");
        }
        String jwtToken = jwtService.extractJwtFromRequest(request);
        String username = jwtService.extractUsername(jwtToken);
        invalidTokenJwt(jwtToken);
        User user = userService.findOneByUsername(username).orElseThrow(() -> new ObjectNotFoundException(ERROR_MESSAGE));
        user.setEmailValid(true);
        Optional<User> userUpdated = userService.updateUser(user);
        if (userUpdated.isPresent()) {
            UserProfileResponse userProfileResponse = new UserProfileResponse(
                    userUpdated.get().getName(), userUpdated.get().getUsername(), userUpdated.get().getEmail(), userUpdated.get().getRole().getName(), userUpdated.get().getColorProfile()
            );
            AuthenticationResponse authenticationResponse = new AuthenticationResponse();
            String newToken = jwtService.generateToken(userUpdated.get(),generateExtraClaims(userUpdated.get()));
            authenticationResponse.setTokenJwt(newToken);
            saveUserAndToken(userUpdated.get(),newToken);
            emailService.sendEmailWelcome(userUpdated.get());
            return new NewUserProfileResponse(userProfileResponse, authenticationResponse);
        }
        return null;
    }

    @Override
    public ValidTokenResponse resetPassword(String email) {
        if (isValidEmail(email)){
            User user = userService.findOneByEmail(email).orElseThrow(() -> new ObjectNotFoundException("Email not found!"));
            String jwtToken = jwtService.generateTokenEmailValidate(user, generateExtraClaimsForEmail(user.getEmail()));
            saveUserAndToken(user, jwtToken);
            emailService.sendEmailPasswordReset(user,jwtToken);
            return new ValidTokenResponse(true);
        }
        return new ValidTokenResponse(false);
    }

    @Override
    public ValidTokenResponse updatePassword(HttpServletRequest request, UpdatePasswordRequest updatePasswordRequest) {
        Boolean isValidToken = validateToken(request);
        if (Boolean.FALSE.equals(isValidToken)) {
            throw new AccessDeniedException("Invalid token");
        }
        String jwtToken = jwtService.extractJwtFromRequest(request);
        String username = jwtService.extractUsername(jwtToken);
        invalidTokenJwt(jwtToken);
        User user = userService.findOneByUsername(username).orElseThrow(() -> new ObjectNotFoundException("User not found!"));
        Optional<User> userUpdated = userService.updatePasswordUser(user,updatePasswordRequest);
        if (userUpdated.isPresent()){
            emailService.sendEmailResetPasswordSuccess(userUpdated.get());
            return new ValidTokenResponse(true);
        }
        return new ValidTokenResponse(false);
    }

    @Override
    public ValidTokenResponse verifyReCaptchaToken(String token) {
        return reCaptchaService.verifyReCaptcha(token);
    }

    @Override
    public NewUserProfileResponse profilePasswordUpdate(HttpServletRequest request, NewUpdatePasswordRequest newUpdatePasswordRequest) {
        String jwtToken = jwtService.extractJwtFromRequest(request);
        String username = jwtService.extractUsername(jwtToken);
        User user = userService.findOneByUsername(username).orElseThrow(() -> new ObjectNotFoundException("User not found!"));
        AuthenticationResponse authResponse = login(new AuthenticationRequest(user.getEmail(), newUpdatePasswordRequest.getCurrentPassword()));
        invalidTokenJwt(authResponse.getTokenJwt());
        Optional<User> userUpdated = userService.updatePasswordUser(user, new UpdatePasswordRequest(newUpdatePasswordRequest.getNewPassword(), newUpdatePasswordRequest.getConfirmNewPassword()));
        if (userUpdated.isPresent()){
            invalidTokenJwt(jwtToken);
            authResponse = login(new AuthenticationRequest(userUpdated.get().getUsername(),newUpdatePasswordRequest.getNewPassword()));
            User newUser = userUpdated.get();
            UserProfileResponse userProfileResponse = new UserProfileResponse(
                    newUser.getName(), newUser.getUsername(), newUser.getEmail(), newUser.getRole().getName(), newUser.getColorProfile()
            );
            return new NewUserProfileResponse(userProfileResponse, authResponse);
        }
        return null;
    }

    @Override
    public ValidTokenResponse sendContactEmail(ContactFormRequest contactFormRequest) {
        emailService.sendContactEmail(contactFormRequest);
        return new ValidTokenResponse(true);
    }
}
