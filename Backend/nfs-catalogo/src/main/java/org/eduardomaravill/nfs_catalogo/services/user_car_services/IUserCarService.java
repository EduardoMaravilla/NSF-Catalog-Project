package org.eduardomaravill.nfs_catalogo.services.user_car_services;

import org.eduardomaravill.nfs_catalogo.dtos.user_car_dtos.CarConfigRequest;

public interface IUserCarService {
    void createUserCarConfiguration(CarConfigRequest carConfigRequest);
}
