package org.eduardomaravill.nfs_catalogo.services.auth.implement;

import jakarta.servlet.http.HttpServletRequest;
import org.eduardomaravill.nfs_catalogo.dtos.auth.*;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserRegistered;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.exceptions.ObjectNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.UsernameOrEmailDuplicateException;
import org.eduardomaravill.nfs_catalogo.models.users_models.JwtToken;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.repositories.users_respositories.IJwtTokenRepository;
import org.eduardomaravill.nfs_catalogo.services.auth.IAuthenticationService;
import org.eduardomaravill.nfs_catalogo.services.auth.IJwtService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IEmailService;
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


    @Autowired
    public AuthenticationServiceImpl(IUserService userService, IJwtService jwtService, IJwtTokenRepository jwtTokenRepository, AuthenticationManager authenticationManager, IEmailService emailService) {
        this.userService = userService;
        this.jwtService = jwtService;
        this.jwtTokenRepository = jwtTokenRepository;
        this.authenticationManager = authenticationManager;
        this.emailService = emailService;
    }

    @Override
    public UserRegistered registerOneRacer(UserSaveDto newUser) {
        User registeredUser = userService.registerOneRacer(newUser);
        String jwtToken = jwtService.generateToken(registeredUser, generateExtraClaims(registeredUser));
        saveUserAndToken(registeredUser, jwtToken);

        UserRegistered userRegistered = new UserRegistered();
        userRegistered.setName(registeredUser.getName());
        userRegistered.setUsername(registeredUser.getUsername());
        userRegistered.setEmail(registeredUser.getEmail());
        userRegistered.setRole(registeredUser.getRole().getName());
        userRegistered.setJwt(jwtToken);
        return userRegistered;
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
        extraClaims.put("authorities", registeredUser.getAuthorities());
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
            emailService.sendEmailVerification(user);
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
        if (jwtTokenVerify.isPresent() && Boolean.TRUE.equals(jwtTokenVerify.get().getIsValid()) && jwtTokenVerify.get().getExpiration().isAfter(LocalDateTime.now())) {
            return true;
        }else {
            return false;
        }
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

}
