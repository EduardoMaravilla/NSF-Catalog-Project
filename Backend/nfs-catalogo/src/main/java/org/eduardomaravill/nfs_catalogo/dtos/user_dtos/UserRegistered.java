package org.eduardomaravill.nfs_catalogo.dtos.user_dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegistered {
    private String username;
    private String name;
    private String email;
    private String role;
    private String jwt;
}
