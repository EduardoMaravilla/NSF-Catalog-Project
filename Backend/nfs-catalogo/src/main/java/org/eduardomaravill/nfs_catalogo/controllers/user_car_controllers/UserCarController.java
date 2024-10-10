package org.eduardomaravill.nfs_catalogo.controllers.user_car_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.user_car_dtos.CarConfigRequest;
import org.eduardomaravill.nfs_catalogo.services.user_car_services.IUserCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/user-car-configurations")
@Validated
public class UserCarController {


    private final IUserCarService userCarService;

    @Autowired
    public UserCarController(IUserCarService userCarService) {
        this.userCarService = userCarService;
    }

    @PostMapping
    public ResponseEntity<Void> createUserCarConfiguration(CarConfigRequest carConfigRequest) {
          userCarService.createUserCarConfiguration(carConfigRequest);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }
}
