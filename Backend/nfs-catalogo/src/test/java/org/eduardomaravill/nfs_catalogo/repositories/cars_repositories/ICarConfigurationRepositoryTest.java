package org.eduardomaravill.nfs_catalogo.repositories.cars_repositories;

import org.eduardomaravill.nfs_catalogo.models.cars_models.*;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
class ICarConfigurationRepositoryTest {

    @Autowired
    private ICarConfigurationRepository carConfigurationRepository;

    @Test
    @DisplayName("Test save CarConfiguration")
    void testSaveCarConfiguration() {
        CarConfiguration carConfiguration = new CarConfiguration();
        carConfiguration.setId(30L);
        carConfiguration.setTopSpeed(350);
        carConfiguration.setOneHundred(3.5);
        carConfiguration.setFourHundred(10.5);
        carConfiguration.setPower(1500);
        carConfiguration.setPar(2000);
        carConfigurationRepository.save(carConfiguration);
        Optional<CarConfiguration> savedCarConfiguration = carConfigurationRepository.findById(carConfiguration.getId());
        assertTrue(savedCarConfiguration.isPresent());
        assertEquals(carConfiguration, savedCarConfiguration.get());
    }

    @Test
    @DisplayName("Test update CarConfiguration")
    void testUpdateCarConfiguration() {
        CarConfiguration carConfiguration = new CarConfiguration();
        carConfiguration.setId(30L);
        carConfiguration.setTopSpeed(350);
        carConfiguration.setOneHundred(3.5);
        carConfiguration.setFourHundred(10.5);
        carConfiguration.setPower(1500);
        carConfiguration.setPar(2000);
        carConfigurationRepository.save(carConfiguration);
        CarConfiguration saveCarConfiguration = carConfigurationRepository.findById(30L).orElse(null);
        assertNotNull(saveCarConfiguration);
        saveCarConfiguration.setTopSpeed(360);
        carConfigurationRepository.save(saveCarConfiguration);
        Optional<CarConfiguration> updatedCarConfiguration = carConfigurationRepository.findById(saveCarConfiguration.getId());
        assertTrue(updatedCarConfiguration.isPresent());
        assertEquals(360, updatedCarConfiguration.get().getTopSpeed());
    }

    @Test
    @DisplayName("Test delete CarConfiguration")
    void testDeleteCarConfiguration() {
        CarConfiguration carConfiguration = new CarConfiguration();
        carConfiguration.setId(30L);
        carConfiguration.setTopSpeed(350);
        carConfiguration.setOneHundred(3.5);
        carConfiguration.setFourHundred(10.5);
        carConfiguration.setPower(1500);
        carConfiguration.setPar(2000);
        carConfigurationRepository.save(carConfiguration);
        CarConfiguration saveCarConfiguration = carConfigurationRepository.findById(30L).orElse(null);
        assertNotNull(saveCarConfiguration);
        carConfigurationRepository.delete(saveCarConfiguration);
        Optional<CarConfiguration> deletedCarConfiguration = carConfigurationRepository.findById(saveCarConfiguration.getId());
        assertFalse(deletedCarConfiguration.isPresent());
    }
}