package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.DriverDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IDriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/drivers")
@Validated
public class DriverController {

    private final IDriverService driverService;

    @Autowired
    public DriverController(IDriverService driverService) {
        this.driverService = driverService;
    }

    @GetMapping("/{idDriver}")
    public ResponseEntity<DriverDto> getDriver(@PathVariable Long idDriver){
        DriverDto driver = driverService.getDriver(idDriver);
        return ResponseEntity.ok(driver);
    }

    @GetMapping("")
    public ResponseEntity<Iterable<DriverDto>> getAllDrivers(){
        return ResponseEntity.ok(driverService.getAllDrivers());
    }

    @PostMapping("")
    public ResponseEntity<Void> createDriver(@RequestBody DriverDto driverDto){
        driverService.createDriver(driverDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idDriver}")
    public ResponseEntity<Void> updateDriver(@PathVariable Long idDriver, @RequestBody DriverDto driverDto){
        driverService.updateDriver(idDriver, driverDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idDriver}")
    public ResponseEntity<Void> deleteDriver(@PathVariable Long idDriver){
        driverService.deleteDriver(idDriver);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
