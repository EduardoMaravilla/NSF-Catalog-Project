package org.eduardomaravill.nfs_catalogo.services.cars_services;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarDto;

import java.util.List;

public interface ICarService {
    CarDto getCar(Long id);

    void createCar(CarDto carDto);

    void updateCar(Long id, CarDto carDto);

    void deleteCar(Long id);

    List<CarDto> getAllCars();
}