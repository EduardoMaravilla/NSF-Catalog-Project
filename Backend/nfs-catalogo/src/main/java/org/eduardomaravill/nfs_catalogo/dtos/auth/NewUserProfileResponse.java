package org.eduardomaravill.nfs_catalogo.dtos.auth;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewUserProfileResponse {
    private UserProfileResponse userProfileResponse;
    private AuthenticationResponse authenticationResponse;
}