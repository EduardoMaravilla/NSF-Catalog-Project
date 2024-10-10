package org.eduardomaravill.nfs_catalogo.repositories.users_respositories;

import org.eduardomaravill.nfs_catalogo.models.users_models.GrantedPermission;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IGrantedPermissionRepository extends JpaRepository<GrantedPermission,Long> {
}
