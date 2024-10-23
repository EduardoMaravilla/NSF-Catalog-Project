package org.eduardomaravill.nfs_catalogo.services.user_car_services;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;

public interface IUserCarConfigurationService {
    ValidTokenResponse createRacerCarConfiguration(CarConfigurationDto carConfigurationDto);
}
