package org.eduardomaravill.nfs_catalogo.services.cars_services;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;

import java.util.List;

public interface ICarConfigurationService {
    CarConfigurationDto getCarConfiguration(Long id);
    CarConfigurationDto createCarConfiguration(CarConfigurationDto carConfigurationDto);
    void updateCarConfiguration(Long id, CarConfigurationDto carConfigurationDto);
    void deleteCarConfiguration(Long id);
    List<CarConfigurationDto> getAllCarConfigurations();
}
