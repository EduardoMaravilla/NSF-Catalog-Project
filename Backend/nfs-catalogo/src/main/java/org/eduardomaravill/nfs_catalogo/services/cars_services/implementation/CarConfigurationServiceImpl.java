package org.eduardomaravill.nfs_catalogo.services.cars_services.implementation;

import jakarta.transaction.Transactional;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.*;
import org.eduardomaravill.nfs_catalogo.exceptions.DataNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceDuplicateException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceNotFoundException;
import org.eduardomaravill.nfs_catalogo.models.cars_models.CarConfiguration;
import org.eduardomaravill.nfs_catalogo.repositories.cars_repositories.ICarConfigurationRepository;
import org.eduardomaravill.nfs_catalogo.services.MapperService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.LongFunction;

@Service
@Transactional
public class CarConfigurationServiceImpl implements ICarConfigurationService {
    private static final String CAR_CONFIGURATION_MESSAGE = "Car Configuration";

    private final ICarConfigurationRepository carConfigurationRepository;

    private final ICarService carService;

    private final IEngineService engineService;

    private final ILevelService levelService;

    private final ITurboService turboService;

    private final ISuspensionService suspensionService;

    private final ITireService tireService;

    private final IGearService gearService;

    private final IDriverService driverService;

    private final IAuxiliarService auxiliarService;

    private final IClassesService classesService;

    private final MapperService mapperService;

    @Autowired
    public CarConfigurationServiceImpl(
            ICarConfigurationRepository carConfigurationRepository,
            ICarService carService, IEngineService engineService,
            ILevelService levelService, ITurboService turboService,
            ISuspensionService suspensionService,
            ITireService tireService, IGearService gearService,
            IDriverService driverService,
            IAuxiliarService auxiliarService,
            IClassesService classesService,
            MapperService mapperService) {
        this.carConfigurationRepository = carConfigurationRepository;
        this.carService = carService;
        this.engineService = engineService;
        this.levelService = levelService;
        this.turboService = turboService;
        this.suspensionService = suspensionService;
        this.tireService = tireService;
        this.gearService = gearService;
        this.driverService = driverService;
        this.auxiliarService = auxiliarService;
        this.classesService = classesService;
        this.mapperService = mapperService;
    }


    @Override
    public CarConfigurationDto getCarConfiguration(Long id) {
        CarConfiguration carConfiguration = carConfigurationRepository.findByIdSpecific(id)
                .orElseThrow(() -> new ResourceNotFoundException(CAR_CONFIGURATION_MESSAGE, id));
        return mapperService.convertToDto(carConfiguration);
    }

    @Override
    public void createCarConfiguration(CarConfigurationDto carConfigurationDto) {
        verifyDataExists(carConfigurationDto);
        if (carConfigurationRepository.existsCarConfiguration(carConfigurationDto.getCarDto().getId(),
                carConfigurationDto.getEngineDto().getId(),
                carConfigurationDto.getInductionLevelDto().getId(),
                carConfigurationDto.getEcuLevelDto().getId(),
                carConfigurationDto.getInjectionLevelDto().getId(),
                carConfigurationDto.getEscapeLevelDto().getId(),
                carConfigurationDto.getTurboDto().getId(),
                carConfigurationDto.getNitroLevelDto().getId(),
                carConfigurationDto.getSuspensionDto().getId(),
                carConfigurationDto.getBrakeLevelDto().getId(),
                carConfigurationDto.getTireDto().getId(),
                carConfigurationDto.getEmbragueLevelDto().getId(),
                carConfigurationDto.getGearDto().getId(),
                carConfigurationDto.getDifferentialLevelDto().getId(),
                carConfigurationDto.getTopSpeed(),
                carConfigurationDto.getOneHundred(),
                carConfigurationDto.getPower(),
                carConfigurationDto.getPar(),
                carConfigurationDto.getFourHundred(),
                carConfigurationDto.getDriverDto().getId(),
                carConfigurationDto.getAuxiliarOneDto().getId(),
                carConfigurationDto.getAuxiliarTwoDto().getId(),
                carConfigurationDto.getClassesDto().getId())) {
            throw new ResourceDuplicateException(CAR_CONFIGURATION_MESSAGE, "this");
        }
        CarConfiguration carConfiguration = mapperService.convertToEntity(carConfigurationDto);
        carConfigurationRepository.save(carConfiguration);

    }

    @Override
    public void updateCarConfiguration(Long id, CarConfigurationDto carConfigurationDto) {
        verifyDataExists(carConfigurationDto);
        verifyExists(id);
        carConfigurationDto.setId(id);
        CarConfiguration carConfiguration = mapperService.convertToEntity(carConfigurationDto);
        carConfigurationRepository.save(carConfiguration);
    }

    @Override
    public void deleteCarConfiguration(Long id) {
        verifyExists(id);
        carConfigurationRepository.deleteById(id);
    }

    @Override
    public List<CarConfigurationDto> getAllCarConfigurations() {
        return carConfigurationRepository.findAll().stream().map(mapperService::convertToDto).toList();
    }

    private void verifyDataExists(CarConfigurationDto carConfigurationDto) {
        Map<String, Long> ids = new HashMap<>();
        ids.put("Car", carConfigurationDto.getCarDto().getId());
        ids.put("Engine", carConfigurationDto.getEngineDto().getId());
        ids.put("InductionLevel", carConfigurationDto.getInductionLevelDto().getId());
        ids.put("EcuLevel", carConfigurationDto.getEcuLevelDto().getId());
        ids.put("InjectionLevel", carConfigurationDto.getInjectionLevelDto().getId());
        ids.put("EscapeLevel", carConfigurationDto.getEscapeLevelDto().getId());
        ids.put("Turbo", carConfigurationDto.getTurboDto().getId());
        ids.put("NitroLevel", carConfigurationDto.getNitroLevelDto().getId());
        ids.put("Suspension", carConfigurationDto.getSuspensionDto().getId());
        ids.put("BrakeLevel", carConfigurationDto.getBrakeLevelDto().getId());
        ids.put("Tire", carConfigurationDto.getTireDto().getId());
        ids.put("EmbragueLevel", carConfigurationDto.getEmbragueLevelDto().getId());
        ids.put("Gear", carConfigurationDto.getGearDto().getId());
        ids.put("DifferentialLevel", carConfigurationDto.getDifferentialLevelDto().getId());
        ids.put("Driver", carConfigurationDto.getDriverDto().getId());
        ids.put("AuxiliarOne", carConfigurationDto.getAuxiliarOneDto().getId());
        ids.put("AuxiliarTwo", carConfigurationDto.getAuxiliarTwoDto().getId());
        ids.put("Classes", carConfigurationDto.getClassesDto().getId());

        Map<String, LongFunction<?>> services = new HashMap<>();
        services.put("Car", carService::getCar);
        services.put("Engine", engineService::getEngine);
        services.put("InductionLevel", levelService::getLevel);
        services.put("EcuLevel", levelService::getLevel);
        services.put("InjectionLevel", levelService::getLevel);
        services.put("EscapeLevel", levelService::getLevel);
        services.put("Turbo", turboService::getTurbo);
        services.put("NitroLevel", levelService::getLevel);
        services.put("Suspension", suspensionService::getSuspension);
        services.put("BrakeLevel", levelService::getLevel);
        services.put("Tire", tireService::getTire);
        services.put("EmbragueLevel", levelService::getLevel);
        services.put("Gear", gearService::getGear);
        services.put("DifferentialLevel", levelService::getLevel);
        services.put("Driver", driverService::getDriver);
        services.put("AuxiliarOne", auxiliarService::getAuxiliar);
        services.put("AuxiliarTwo", auxiliarService::getAuxiliar);
        services.put("Classes", classesService::getClasses);

        ids.forEach((key, id) -> verifyEntity(key, id, services.get(key)));

    }

    private <T> void verifyEntity(String entityName, Long id, LongFunction<T> serviceMethod) {
        T entity = serviceMethod.apply(id);
        if (entity == null) {
            throw new DataNotFoundException(entityName);
        }
    }


    private void verifyExists(Long id) {
        if (!carConfigurationRepository.existsById(id)) {
            throw new ResourceNotFoundException(CAR_CONFIGURATION_MESSAGE, id);
        }
    }
}
