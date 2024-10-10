package org.eduardomaravill.nfs_catalogo.services.cars_services.implementation;

import jakarta.transaction.Transactional;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.DriverDto;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.InitSkidDto;
import org.eduardomaravill.nfs_catalogo.exceptions.DataNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceDuplicateException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceNotFoundException;
import org.eduardomaravill.nfs_catalogo.models.cars_models.Driver;
import org.eduardomaravill.nfs_catalogo.repositories.cars_repositories.IDriverRepository;
import org.eduardomaravill.nfs_catalogo.services.MapperService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IDriverService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IInitSkidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class DriverServiceImpl implements IDriverService {

    private static final String DRIVER_MESSAGE = "Driver";

    private final IDriverRepository driverRepository;

    private final IInitSkidService initSkidService;

    private final MapperService mapperService;

    @Autowired
    public DriverServiceImpl(IDriverRepository driverRepository, IInitSkidService initSkidService, MapperService mapperService) {
        this.driverRepository = driverRepository;
        this.initSkidService = initSkidService;
        this.mapperService = mapperService;
    }

    @Override
    public DriverDto getDriver(Long id) {
        Driver driver = driverRepository.findByIdSpecific(id).orElseThrow(() -> new ResourceNotFoundException(DRIVER_MESSAGE, id));
        return mapperService.convertToDto(driver);
    }

    @Override
    public void createDriver(DriverDto driverDto) {
        verifyDataExists(driverDto);
        if (existsDriver(driverDto)) {
            throw new ResourceDuplicateException(DRIVER_MESSAGE, "this");
        }
        Driver driver = mapperService.convertToEntity(driverDto);
        driverRepository.save(driver);
    }

    @Override
    public void updateDriver(Long id, DriverDto driverDto) {
        verifyDataExists(driverDto);
        verifyExists(id);
        driverDto.setId(id);
        Driver driver = mapperService.convertToEntity(driverDto);
        driverRepository.save(driver);
    }

    @Override
    public void deleteDriver(Long id) {
        verifyExists(id);
        driverRepository.deleteById(id);
    }

    @Override
    public List<DriverDto> getAllDrivers() {
        return driverRepository.findAll().stream().map(mapperService::convertToDto).toList();
    }

    private void verifyDataExists(DriverDto driverDto) {
        InitSkidDto initSkidDto = initSkidService.getInitSkid(driverDto.getInitSkidDto().getId());
        if (!initSkidDto.equals(driverDto.getInitSkidDto())) {
            throw new DataNotFoundException(driverDto.getInitSkidDto().getSkidType());
        }
    }

    private void verifyExists(Long id) {
        if (!driverRepository.existsById(id)) {
            throw new ResourceNotFoundException(DRIVER_MESSAGE, id);
        }
    }

    private boolean existsDriver(DriverDto driverDto) {
        return driverRepository.existsDriver(driverDto.getDrive(), driverDto.getDirection()
                , driverDto.getDownForce(), driverDto.getControlTraction(), driverDto.getInitSkidDto().getId());
    }
}
