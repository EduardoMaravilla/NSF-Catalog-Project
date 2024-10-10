package org.eduardomaravill.nfs_catalogo.repositories.users_respositories;

import org.eduardomaravill.nfs_catalogo.models.users_models.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IRoleRepository extends JpaRepository<Role,Long> {
    Optional<Role> findByName(String defaultRole);
}
