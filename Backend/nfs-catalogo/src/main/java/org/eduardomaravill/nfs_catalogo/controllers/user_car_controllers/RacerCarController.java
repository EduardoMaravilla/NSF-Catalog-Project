package org.eduardomaravill.nfs_catalogo.controllers.user_car_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;
import org.eduardomaravill.nfs_catalogo.services.user_car_services.IUserCarConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/racer-car-configurations")
@Validated
public class RacerCarController {


    private final IUserCarConfigurationService userCarConfigurationService;

    @Autowired
    public RacerCarController(IUserCarConfigurationService userCarConfigurationService) {
        this.userCarConfigurationService = userCarConfigurationService;
    }

    @PostMapping("/save-car-configuration")
    public ResponseEntity<ValidTokenResponse> createRacerCarConfiguration(@RequestBody CarConfigurationDto carConfigurationDto) {
        ValidTokenResponse validTokenResponse = userCarConfigurationService.createRacerCarConfiguration(carConfigurationDto);
        return new ResponseEntity<>(validTokenResponse, HttpStatus.CREATED);
    }
}
