package org.eduardomaravill.nfs_catalogo.services.user_car_services.implement;

import org.eduardomaravill.nfs_catalogo.dtos.auth.ValidTokenResponse;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.CarConfigurationDto;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.DriverDto;
import org.eduardomaravill.nfs_catalogo.exceptions.ObjectNotFoundException;
import org.eduardomaravill.nfs_catalogo.models.cars_models.CarConfiguration;
import org.eduardomaravill.nfs_catalogo.models.usercarconfig_models.UserCarConfiguration;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;
import org.eduardomaravill.nfs_catalogo.repositories.users_cars_repositories.IUserCarConfigurationRepository;
import org.eduardomaravill.nfs_catalogo.services.MapperService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ICarConfigurationService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IDriverService;
import org.eduardomaravill.nfs_catalogo.services.user_car_services.IUserCarConfigurationService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UserCarConfigurationServiceImpl implements IUserCarConfigurationService {

    private final MapperService mapperService;
    private final IUserService userService;
    private final ICarConfigurationService carConfigurationService;
    private final IDriverService driverService;
    private final IUserCarConfigurationRepository userCarConfigurationRepository;

    @Autowired
    public UserCarConfigurationServiceImpl(IUserService userService, MapperService mapperService,
                                           ICarConfigurationService carConfigurationService, IDriverService driverService
            , IUserCarConfigurationRepository userCarConfigurationRepository) {
        this.userService = userService;
        this.mapperService = mapperService;
        this.carConfigurationService = carConfigurationService;
        this.driverService = driverService;
        this.userCarConfigurationRepository = userCarConfigurationRepository;
    }

    @Override
    public ValidTokenResponse createRacerCarConfiguration(CarConfigurationDto carConfigurationDto) {

        String username = (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.findOneByUsername(username).orElseThrow(() -> new ObjectNotFoundException("user not found. Username; " + username));

        try {
            DriverDto driverDto = carConfigurationDto.getDriverDto();
            driverDto = driverService.createOrGet(driverDto);
            carConfigurationDto.setDriverDto(driverDto);
            CarConfigurationDto carConfigurationDto1 = carConfigurationService.createCarConfiguration(carConfigurationDto);
            CarConfiguration carConfiguration = mapperService.convertToEntity(carConfigurationDto1);
            UserCarConfiguration userCarConfiguration = new UserCarConfiguration();
            userCarConfiguration.setUser(user);
            userCarConfiguration.setCarConfiguration(carConfiguration);
            userCarConfigurationRepository.save(userCarConfiguration);
            return new ValidTokenResponse(true);
        } catch (Exception e) {
            return new ValidTokenResponse(false);
        }
    }
}
