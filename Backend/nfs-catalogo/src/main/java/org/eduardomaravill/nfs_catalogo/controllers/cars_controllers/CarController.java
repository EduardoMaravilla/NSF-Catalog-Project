package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/cars")
@Validated
public class CarController {

    private final ICarService carService;

    @Autowired
    public CarController(ICarService carService) {
        this.carService = carService;
    }

    @GetMapping("/{idCar}")
    public ResponseEntity<CarDto> getCar(@PathVariable Long idCar){
        CarDto car = carService.getCar(idCar);
        return ResponseEntity.ok(car);
    }

    @GetMapping("")
    public ResponseEntity<List<CarDto>> getAllCars(){
        return ResponseEntity.ok(carService.getAllCars());
    }

    @PostMapping("")
    public ResponseEntity<Void> createCar(@RequestBody CarDto carDto){
        carService.createCar(carDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idCar}")
    public ResponseEntity<Void> updateCar(@PathVariable Long idCar, @RequestBody CarDto carDto){
        carService.updateCar(idCar, carDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idCar}")
    public ResponseEntity<Void> deleteCar(@PathVariable Long idCar){
        carService.deleteCar(idCar);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
