package org.eduardomaravill.nfs_catalogo.dtos.auth;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserEditProfileRequest {
    private String colorEdit;
    private String nameEdit;
    private String usernameEdit;
    private String emailEdit;
    private String roleEdit;
    private String passwordEdit;
}
