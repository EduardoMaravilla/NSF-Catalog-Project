package org.eduardomaravill.nfs_catalogo.services.users_services;

import org.eduardomaravill.nfs_catalogo.models.users_models.Role;

import java.util.Optional;

public interface IRoleService {
    Optional<Role> findDefaultRole();
}
