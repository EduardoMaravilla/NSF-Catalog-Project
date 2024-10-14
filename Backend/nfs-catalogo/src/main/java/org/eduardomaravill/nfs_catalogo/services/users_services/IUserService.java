package org.eduardomaravill.nfs_catalogo.services.users_services;

import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UpdatePasswordRequest;
import org.eduardomaravill.nfs_catalogo.dtos.user_dtos.UserSaveDto;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;

import java.util.Optional;

public interface IUserService {
    User registerOneRacer(UserSaveDto newUser);

    Optional<User> findOneByUsername(String username);
    Optional<User> findOneByEmail(String email);

    Optional<User> updateUser(User user);

    Optional<User> updatePasswordUser(User user, UpdatePasswordRequest updatePasswordRequest);
}
