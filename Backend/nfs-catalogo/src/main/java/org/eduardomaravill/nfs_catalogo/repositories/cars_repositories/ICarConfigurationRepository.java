package org.eduardomaravill.nfs_catalogo.repositories.cars_repositories;

import org.eduardomaravill.nfs_catalogo.models.cars_models.CarConfiguration;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ICarConfigurationRepository extends JpaRepository<CarConfiguration,Long> {

    @Query("SELECT c FROM CarConfiguration c " +
            "JOIN FETCH c.driver " +
            "WHERE c.id = :id")
    Optional<CarConfiguration> findByIdSpecific(@Param("id") Long id);

    @Query("SELECT COUNT(cc) > 0 FROM CarConfiguration cc WHERE " +
            "cc.car.id = :carId " +
            "AND cc.engine.id = :engineId " +
            "AND cc.inductionLevelEntity.id = :inductionLevelId " +
            "AND cc.ecuLevelEntity.id = :ecuLevelId " +
            "AND cc.injectionLevelEntity.id = :injectionLevelId " +
            "AND cc.escapeLevelEntity.id = :escapeLevelId " +
            "AND cc.turbo.id = :turboId " +
            "AND cc.nitroLevelEntity.id = :nitroLevelId " +
            "AND cc.suspension.id = :suspensionId " +
            "AND cc.brakeLevelEntity.id = :brakeLevelId " +
            "AND cc.tire.id = :tireId " +
            "AND cc.embragueLevelEntity.id = :embragueLevelId " +
            "AND cc.gear.id = :gearId " +
            "AND cc.differentialLevelEntity.id = :differentialLevelId " +
            "AND cc.topSpeed = :topSpeed " +
            "AND cc.oneHundred = :oneHundred " +
            "AND cc.power = :power " +
            "AND cc.par = :par " +
            "AND cc.fourHundred = :fourHundred " +
            "AND cc.driver.id = :driverId " +
            "AND cc.auxiliaryOne.id = :auxiliarOneId " +
            "AND cc.auxiliaryTwo.id = :auxiliarTwoId " +
            "AND cc.classes.id = :classesId")
    boolean existsCarConfiguration(@Param("carId") Long carId,
                                   @Param("engineId") Long engineId,
                                   @Param("inductionLevelId") Long inductionLevelId,
                                   @Param("ecuLevelId") Long ecuLevelId,
                                   @Param("injectionLevelId") Long injectionLevelId,
                                   @Param("escapeLevelId") Long escapeLevelId,
                                   @Param("turboId") Long turboId,
                                   @Param("nitroLevelId") Long nitroLevelId,
                                   @Param("suspensionId") Long suspensionId,
                                   @Param("brakeLevelId") Long brakeLevelId,
                                   @Param("tireId") Long tireId,
                                   @Param("embragueLevelId") Long embragueLevelId,
                                   @Param("gearId") Long gearId,
                                   @Param("differentialLevelId") Long differentialLevelId,
                                   @Param("topSpeed") Integer topSpeed,
                                   @Param("oneHundred") Double oneHundred,
                                   @Param("power") Integer power,
                                   @Param("par") Integer par,
                                   @Param("fourHundred") Double fourHundred,
                                   @Param("driverId") Long driverId,
                                   @Param("auxiliarOneId") Long auxiliarOneId,
                                   @Param("auxiliarTwoId") Long auxiliarTwoId,
                                   @Param("classesId") Long classesId);
    @Query("SELECT cc FROM CarConfiguration cc WHERE " +
            "cc.car.id = :carId " +
            "AND cc.engine.id = :engineId " +
            "AND cc.inductionLevelEntity.id = :inductionLevelId " +
            "AND cc.ecuLevelEntity.id = :ecuLevelId " +
            "AND cc.injectionLevelEntity.id = :injectionLevelId " +
            "AND cc.escapeLevelEntity.id = :escapeLevelId " +
            "AND cc.turbo.id = :turboId " +
            "AND cc.nitroLevelEntity.id = :nitroLevelId " +
            "AND cc.suspension.id = :suspensionId " +
            "AND cc.brakeLevelEntity.id = :brakeLevelId " +
            "AND cc.tire.id = :tireId " +
            "AND cc.embragueLevelEntity.id = :embragueLevelId " +
            "AND cc.gear.id = :gearId " +
            "AND cc.differentialLevelEntity.id = :differentialLevelId " +
            "AND cc.topSpeed = :topSpeed " +
            "AND cc.oneHundred = :oneHundred " +
            "AND cc.power = :power " +
            "AND cc.par = :par " +
            "AND cc.fourHundred = :fourHundred " +
            "AND cc.driver.id = :driverId "+
            "AND cc.auxiliaryOne.id = :auxiliarOneId " +
            "AND cc.auxiliaryTwo.id = :auxiliarTwoId " +
            "AND cc.classes.id = :classesId")
    Optional<CarConfiguration> findExistingCarConfiguration(@Param("carId") Long carId,
                                                            @Param("engineId") Long engineId,
                                                            @Param("inductionLevelId") Long inductionLevelId,
                                                            @Param("ecuLevelId") Long ecuLevelId,
                                                            @Param("injectionLevelId") Long injectionLevelId,
                                                            @Param("escapeLevelId") Long escapeLevelId,
                                                            @Param("turboId") Long turboId,
                                                            @Param("nitroLevelId") Long nitroLevelId,
                                                            @Param("suspensionId") Long suspensionId,
                                                            @Param("brakeLevelId") Long brakeLevelId,
                                                            @Param("tireId") Long tireId,
                                                            @Param("embragueLevelId") Long embragueLevelId,
                                                            @Param("gearId") Long gearId,
                                                            @Param("differentialLevelId") Long differentialLevelId,
                                                            @Param("topSpeed") Integer topSpeed,
                                                            @Param("oneHundred") Double oneHundred,
                                                            @Param("power") Integer power,
                                                            @Param("par") Integer par,
                                                            @Param("fourHundred") Double fourHundred,
                                                            @Param("driverId") Long driverId,
                                                            @Param("auxiliarOneId") Long auxiliarOneId,
                                                            @Param("auxiliarTwoId") Long auxiliarTwoId,
                                                            @Param("classesId") Long classesId);


}
