package org.eduardomaravill.nfs_catalogo.dtos.user_car_dtos;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.eduardomaravill.nfs_catalogo.dtos.auth.UserProfileResponse;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarConfigRequest {
    @NotNull
    private UserProfileResponse userProfile;

    @NotNull
    private CarConfigurationDto carConfig;
}
