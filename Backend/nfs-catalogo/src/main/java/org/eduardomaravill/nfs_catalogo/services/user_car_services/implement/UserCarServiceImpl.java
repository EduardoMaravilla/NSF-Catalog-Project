package org.eduardomaravill.nfs_catalogo.services.user_car_services.implement;

import org.eduardomaravill.nfs_catalogo.dtos.user_car_dtos.CarConfigRequest;
import org.eduardomaravill.nfs_catalogo.services.user_car_services.IUserCarService;
import org.springframework.stereotype.Service;

@Service
public class UserCarServiceImpl implements IUserCarService {
    @Override
    public void createUserCarConfiguration(CarConfigRequest carConfigRequest) {
        System.out.println("Se ejecuta guardar");
    }
}
