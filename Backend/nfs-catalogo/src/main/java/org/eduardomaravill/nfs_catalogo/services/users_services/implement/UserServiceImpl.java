package org.eduardomaravill.nfs_catalogo.services.users_services.implement;

import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.exceptions.InvalidPasswordException;
import org.eduardomaravill.nfs_catalogo.exceptions.ObjectNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.UsernameOrEmailDuplicateException;
import org.eduardomaravill.nfs_catalogo.models.users_models.Role;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.repositories.users_respositories.IUserRepository;
import org.eduardomaravill.nfs_catalogo.services.users_services.IRoleService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Optional;

@Service
public class UserServiceImpl implements IUserService {

    private final IUserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    private final IRoleService roleService;

    @Autowired
    public UserServiceImpl(IUserRepository userRepository, PasswordEncoder passwordEncoder, IRoleService roleService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleService = roleService;
    }

    @Override
    public User registerOneRacer(UserSaveDto newUser) {
        if (findOneByUsername(newUser.getUsername()).isPresent()) {
            throw new UsernameOrEmailDuplicateException("User already exists");
        }
        if (findOneByEmail(newUser.getEmail()).isPresent()) {
            throw new UsernameOrEmailDuplicateException("Email already exists");
        }
        validatePassword(newUser);
        User user = new User();
        user.setName(newUser.getName());
        user.setUsername(newUser.getUsername());
        user.setPassword(passwordEncoder.encode(newUser.getPassword()));
        user.setEmail(newUser.getEmail());
        Role defaultRole = roleService.findDefaultRole()
                .orElseThrow(()-> new ObjectNotFoundException("Default role not found"));
        user.setRole(defaultRole);
        user.setEmailValid(false);
        user.setColorProfile("#000000");
        return userRepository.save(user);
    }

    @Override
    public Optional<User> findOneByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Optional<User> findOneByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public Optional<User> updateUser(User user) {
        return Optional.of(userRepository.save(user));
    }

    @Override
    public Optional<User> updatePasswordUser(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));
        return Optional.of(userRepository.save(user));
    }

    private void validatePassword(UserSaveDto newUser) {
        if (!newUser.getPassword().equals(newUser.getRepeatedPassword())){
            throw new InvalidPasswordException("Passwords do not match");
        }
        if (!StringUtils.hasText(newUser.getPassword()) || !StringUtils.hasText(newUser.getRepeatedPassword())) {
            throw new InvalidPasswordException("Passwords do not match");
        }
    }
}
