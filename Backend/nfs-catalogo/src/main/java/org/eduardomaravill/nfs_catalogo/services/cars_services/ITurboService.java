package org.eduardomaravill.nfs_catalogo.services.cars_services;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TurboDto;

import java.util.List;

public interface ITurboService {
    TurboDto getTurbo(Long id);

    void createTurbo(TurboDto turboDto);

    void updateTurbo(Long id, TurboDto turboDto);

    void deleteTurbo(Long id);

    List<TurboDto> getAllTurbos();
}