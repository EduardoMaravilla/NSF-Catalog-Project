package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.*;
import org.eduardomaravill.nfs_catalogo.repositories.users_respositories.IJwtTokenRepository;
import org.eduardomaravill.nfs_catalogo.services.auth.IJwtService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ICarConfigurationService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IStreetTypeService;
import org.eduardomaravill.nfs_catalogo.services.users_services.IUserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CarConfigurationController.class)
@AutoConfigureMockMvc(addFilters = false)
class CarConfigurationControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private IJwtService jwtService;

    @MockBean
    private IStreetTypeService streetTypeService;

    @MockBean
    private IJwtTokenRepository jwtTokenRepository;

    @MockBean
    private IUserService userService;

    @MockBean
    private ICarConfigurationService carConfigurationService;

    private CarConfigurationDto carConfigurationDto;

    @BeforeEach
    void setUp() {
        carConfigurationDto = new CarConfigurationDto();
        carConfigurationDto.setId(30L);
        carConfigurationDto.setCarDto(new CarDto(20L, new MakerDto(4L, "Ford"), "Mustang", "1964"));
        carConfigurationDto.setEngineDto(new EngineDto(10L, 1000, 8.5, "V8 híbrido", new LevelDto(5L, "Elite")));
        carConfigurationDto.setInductionLevelDto(new LevelDto(1L, "Básico"));
        carConfigurationDto.setEcuLevelDto(new LevelDto(2L, "Deportivo"));
        carConfigurationDto.setInjectionLevelDto(new LevelDto(3L, "Pro"));
        carConfigurationDto.setEscapeLevelDto(new LevelDto(4L, "Super"));
        carConfigurationDto.setTurboDto(new TurboDto(5L, new TurboTypeDto(2L, "DobleTurboCompresor"), new LevelDto(1L, "Básico")));
        carConfigurationDto.setNitroLevelDto(new LevelDto(5L, "Elite"));
        carConfigurationDto.setSuspensionDto(new SuspensionDto(6L, new StreetTypeDto(2L, "TodoTerreno"), new LevelDto(2L, "Deportivo")));
        carConfigurationDto.setBrakeLevelDto(new LevelDto(3L, "Pro"));
        carConfigurationDto.setTireDto(new TireDto(7L, new StreetTypeDto(4L, "Derrape"), new LevelDto(3L, "Pro")));
        carConfigurationDto.setEmbragueLevelDto(new LevelDto(1L, "Básico"));
        carConfigurationDto.setGearDto(new GearDto(3L, 3, new LevelDto(3L, "Deportivo")));
        carConfigurationDto.setDifferentialLevelDto(new LevelDto(2L, "Deportivo"));
        carConfigurationDto.setTopSpeed(350);
        carConfigurationDto.setOneHundred(3.5);
        carConfigurationDto.setFourHundred(10.5);
        carConfigurationDto.setPower(1500);
        carConfigurationDto.setPar(2000);
        carConfigurationDto.setDriverDto(new DriverDto(2L, 100, 5, 5, true, new InitSkidDto(4L, "POR DEFECTO")));
    }

    @Test
    @DisplayName("Test controller get CarConfiguration")
    void getCarConfiguration() throws Exception {
        when(carConfigurationService.getCarConfiguration(anyLong())).thenReturn(carConfigurationDto);

        mockMvc.perform(get("/car-configurations/{id}", 30L))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.id").value(carConfigurationDto.getId()))
                .andExpect(jsonPath("$.carDto.model").value(carConfigurationDto.getCarDto().getModel()))
                .andExpect(jsonPath("$.engineDto.model").value(carConfigurationDto.getEngineDto().getModel()))
                .andExpect(jsonPath("$.inductionLevelDto.level").value(carConfigurationDto.getInductionLevelDto().getLevel()))
                .andExpect(jsonPath("$.ecuLevelDto.level").value(carConfigurationDto.getEcuLevelDto().getLevel()))
                .andExpect(jsonPath("$.injectionLevelDto.level").value(carConfigurationDto.getInjectionLevelDto().getLevel()))
                .andExpect(jsonPath("$.escapeLevelDto.level").value(carConfigurationDto.getEscapeLevelDto().getLevel()))
                .andExpect(jsonPath("$.turboDto.turboTypeDto.type").value(carConfigurationDto.getTurboDto().getTurboTypeDto().getType()))
                .andExpect(jsonPath("$.nitroLevelDto.level").value(carConfigurationDto.getNitroLevelDto().getLevel()))
                .andExpect(jsonPath("$.suspensionDto.streetTypeDto.streetTypeVal").value(carConfigurationDto.getSuspensionDto().getStreetTypeDto().getStreetTypeVal()))
                .andExpect(jsonPath("$.brakeLevelDto.level").value(carConfigurationDto.getBrakeLevelDto().getLevel()))
                .andExpect(jsonPath("$.tireDto.streetTypeDto.streetTypeVal").value(carConfigurationDto.getTireDto().getStreetTypeDto().getStreetTypeVal()))
                .andExpect(jsonPath("$.embragueLevelDto.level").value(carConfigurationDto.getEmbragueLevelDto().getLevel()))
                .andExpect(jsonPath("$.gearDto.gearValue").value(carConfigurationDto.getGearDto().getGearValue()))
                .andExpect(jsonPath("$.differentialLevelDto.level").value(carConfigurationDto.getDifferentialLevelDto().getLevel()))
                .andExpect(jsonPath("$.topSpeed").value(carConfigurationDto.getTopSpeed()))
                .andExpect(jsonPath("$.oneHundred").value(carConfigurationDto.getOneHundred()))
                .andExpect(jsonPath("$.fourHundred").value(carConfigurationDto.getFourHundred()))
                .andExpect(jsonPath("$.power").value(carConfigurationDto.getPower()))
                .andExpect(jsonPath("$.par").value(carConfigurationDto.getPar()))
                .andExpect(jsonPath("$.driverDto.initSkidDto.skidType").value(carConfigurationDto.getDriverDto().getInitSkidDto().getSkidType()));

        verify(carConfigurationService, times(1)).getCarConfiguration(anyLong());
    }

    @Test
    @DisplayName("Test controller getAllCarConfigurations")
    void getAllCarConfigurations() throws Exception {
        List<CarConfigurationDto> carConfigurationDtoList = List.of(carConfigurationDto, carConfigurationDto, carConfigurationDto
                , carConfigurationDto, carConfigurationDto, carConfigurationDto);
        when(carConfigurationService.getAllCarConfigurations()).thenReturn(carConfigurationDtoList);

        mockMvc.perform(get("/car-configurations"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].id").value(carConfigurationDto.getId()))
                .andExpect(jsonPath("$[1].carDto.model").value(carConfigurationDto.getCarDto().getModel()))
                .andExpect(jsonPath("$[2].engineDto.model").value(carConfigurationDto.getEngineDto().getModel()))
                .andExpect(jsonPath("$[3].inductionLevelDto.level").value(carConfigurationDto.getInductionLevelDto().getLevel()))
                .andExpect(jsonPath("$[4].ecuLevelDto.level").value(carConfigurationDto.getEcuLevelDto().getLevel()))
                .andExpect(jsonPath("$[5].injectionLevelDto.level").value(carConfigurationDto.getInjectionLevelDto().getLevel()))
                .andExpect(jsonPath("$[4].escapeLevelDto.level").value(carConfigurationDto.getEscapeLevelDto().getLevel()))
                .andExpect(jsonPath("$[3].turboDto.turboTypeDto.type").value(carConfigurationDto.getTurboDto().getTurboTypeDto().getType()))
                .andExpect(jsonPath("$[2].nitroLevelDto.level").value(carConfigurationDto.getNitroLevelDto().getLevel()))
                .andExpect(jsonPath("$[1].suspensionDto.streetTypeDto.streetTypeVal").value(carConfigurationDto.getSuspensionDto().getStreetTypeDto().getStreetTypeVal()))
                .andExpect(jsonPath("$[0].brakeLevelDto.level").value(carConfigurationDto.getBrakeLevelDto().getLevel()))
                .andExpect(jsonPath("$[1].tireDto.streetTypeDto.streetTypeVal").value(carConfigurationDto.getTireDto().getStreetTypeDto().getStreetTypeVal()))
                .andExpect(jsonPath("$[2].embragueLevelDto.level").value(carConfigurationDto.getEmbragueLevelDto().getLevel()))
                .andExpect(jsonPath("$[3].gearDto.gearValue").value(carConfigurationDto.getGearDto().getGearValue()))
                .andExpect(jsonPath("$[4].differentialLevelDto.level").value(carConfigurationDto.getDifferentialLevelDto().getLevel()))
                .andExpect(jsonPath("$[5].topSpeed").value(carConfigurationDto.getTopSpeed()))
                .andExpect(jsonPath("$[4].oneHundred").value(carConfigurationDto.getOneHundred()))
                .andExpect(jsonPath("$[3].fourHundred").value(carConfigurationDto.getFourHundred()))
                .andExpect(jsonPath("$[2].power").value(carConfigurationDto.getPower()))
                .andExpect(jsonPath("$[1].par").value(carConfigurationDto.getPar()))
                .andExpect(jsonPath("$[0].driverDto.initSkidDto.skidType").value(carConfigurationDto.getDriverDto().getInitSkidDto().getSkidType()));

        verify(carConfigurationService, times(1)).getAllCarConfigurations();
    }

    @Test
    @DisplayName("Test controller create CarConfiguration")
    void createCarConfiguration() throws Exception {
        doNothing().when(carConfigurationService).createCarConfiguration(any(CarConfigurationDto.class));


        mockMvc.perform(post("/car-configurations")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"carDto\":{\"id\":3,\"makerDto\":{\"id\":40,\"name\":\"Alfa Romeo\"},\"model\":\"Giulia Quadrifoglio\",\"year\":\"2016\"}," +
                                "\"engineDto\":{\"id\":2,\"bhp\":573,\"liters\":3.5,\"model\":\"V6 híbrido\",\"levelDto\":{\"id\":2,\"level\":\"Deportivo\"}}," +
                                "\"inductionLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"ecuLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"injectionLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"escapeLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"turboDto\":{\"id\":6,\"turboTypeDto\":{\"id\":3,\"type\":\"Sobrealimentador Centrífugo\"},\"levelDto\":{\"id\":4,\"level\":\"Super\"}}," +
                                "\"nitroLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"suspensionDto\":{\"id\":12,\"streetTypeDto\":{\"id\":5,\"streetType\":\"Asfalto\"},\"levelDto\":{\"id\":5,\"level\":\"Elite\"}}," +
                                "\"brakeLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"tireDto\":{\"id\":18,\"streetTypeDto\":{\"id\":2,\"streetType\":\"Agarre\"},\"levelDto\":{\"id\":5,\"level\":\"Elite\"}}," +
                                "\"embragueLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"gearDto\":{\"id\":5,\"gear\":5,\"levelDto\":{\"id\":2,\"level\":\"Deportivo\"}}," +
                                "\"differentialLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"topSpeed\":250,\"oneHundred\":5.3,\"power\":600,\"par\":800," +
                                "\"fourHundred\":11.2," +
                                "\"driverDto\":{\"id\":1,\"drive\":100,\"direction\":5,\"downForce\":5,\"controlTraction\":false,\"initSkidDto\":{\"id\":4,\"skidType\":\"POR DEFECTO\"}}}"))
                .andExpect(status().isCreated());

        verify(carConfigurationService, times(1)).createCarConfiguration(any(CarConfigurationDto.class));
    }

    @Test
    @DisplayName("Test controller update CarConfiguration")
    void updateCarConfiguration() throws Exception{
        doNothing().when(carConfigurationService).updateCarConfiguration(anyLong(),any(CarConfigurationDto.class));

        mockMvc.perform(put("/car-configurations/{id}",30L)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{\"carDto\":{\"id\":3,\"makerDto\":{\"id\":40,\"name\":\"Alfa Romeo\"},\"model\":\"Giulia Quadrifoglio\",\"year\":\"2016\"}," +
                                "\"engineDto\":{\"id\":2,\"bhp\":573,\"liters\":3.5,\"model\":\"V6 híbrido\",\"levelDto\":{\"id\":2,\"level\":\"Deportivo\"}}," +
                                "\"inductionLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"ecuLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"injectionLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"escapeLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"turboDto\":{\"id\":6,\"turboTypeDto\":{\"id\":3,\"type\":\"Sobrealimentador Centrífugo\"},\"levelDto\":{\"id\":4,\"level\":\"Super\"}}," +
                                "\"nitroLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"suspensionDto\":{\"id\":12,\"streetTypeDto\":{\"id\":5,\"streetType\":\"Asfalto\"},\"levelDto\":{\"id\":5,\"level\":\"Elite\"}}," +
                                "\"brakeLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"tireDto\":{\"id\":18,\"streetTypeDto\":{\"id\":2,\"streetType\":\"Agarre\"},\"levelDto\":{\"id\":5,\"level\":\"Elite\"}}," +
                                "\"embragueLevelDto\":{\"id\":2,\"level\":\"Deportivo\"}," +
                                "\"gearDto\":{\"id\":5,\"gear\":5,\"levelDto\":{\"id\":2,\"level\":\"Deportivo\"}}," +
                                "\"differentialLevelDto\":{\"id\":2,\"level\":\"Deportivo\"},\"topSpeed\":250,\"oneHundred\":5.3,\"power\":600,\"par\":800," +
                                "\"fourHundred\":11.2," +
                                "\"driverDto\":{\"id\":1,\"drive\":100,\"direction\":5,\"downForce\":5,\"controlTraction\":false,\"initSkidDto\":{\"id\":4,\"skidType\":\"POR DEFECTO\"}}}"))
                .andExpect(status().isOk());

        verify(carConfigurationService, times(1)).updateCarConfiguration(anyLong(), any(CarConfigurationDto.class));
    }

    @Test
    @DisplayName("Test controller delete CarConfiguration")
    void deleteCarConfiguration() throws Exception {
        doNothing().when(carConfigurationService).deleteCarConfiguration(anyLong());

        mockMvc.perform(delete("/car-configurations/{id}", 30L))
                .andExpect(status().isOk());

        verify(carConfigurationService, times(1)).deleteCarConfiguration(anyLong());
    }
}