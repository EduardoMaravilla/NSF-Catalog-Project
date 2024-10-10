package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ICarConfigurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/car-configurations")
@Validated
public class CarConfigurationController {

    private final ICarConfigurationService carConfigurationService;

    @Autowired
    public CarConfigurationController(ICarConfigurationService carConfigurationService) {
        this.carConfigurationService = carConfigurationService;
    }

    @GetMapping("/{idCarConfiguration}")
    public ResponseEntity<CarConfigurationDto> getCarConfiguration(@PathVariable Long idCarConfiguration) {
        CarConfigurationDto carConfiguration = carConfigurationService.getCarConfiguration(idCarConfiguration);
        return ResponseEntity.ok(carConfiguration);
    }

    @GetMapping("")
    public ResponseEntity<List<CarConfigurationDto>> getAllCarConfigurations() {
        return ResponseEntity.ok(carConfigurationService.getAllCarConfigurations());
    }

    @PostMapping("")
    public ResponseEntity<Void> createCarConfiguration(@RequestBody CarConfigurationDto carConfigurationDto) {
        carConfigurationService.createCarConfiguration(carConfigurationDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idCarConfiguration}")
    public ResponseEntity<Void> updateCarConfiguration(@PathVariable Long idCarConfiguration, @RequestBody CarConfigurationDto carConfigurationDto) {
        carConfigurationService.updateCarConfiguration(idCarConfiguration, carConfigurationDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idCarConfiguration}")
    public ResponseEntity<Void> deleteCarConfiguration(@PathVariable Long idCarConfiguration) {
        carConfigurationService.deleteCarConfiguration(idCarConfiguration);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
