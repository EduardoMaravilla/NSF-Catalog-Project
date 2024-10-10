package org.eduardomaravill.nfs_catalogo.services.cars_services.implementation;

import jakarta.transaction.Transactional;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.LevelDto;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TurboDto;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TurboTypeDto;
import org.eduardomaravill.nfs_catalogo.exceptions.DataNotFoundException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceDuplicateException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceNotFoundException;
import org.eduardomaravill.nfs_catalogo.models.cars_models.Turbo;
import org.eduardomaravill.nfs_catalogo.repositories.cars_repositories.ITurboRepository;
import org.eduardomaravill.nfs_catalogo.services.MapperService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ILevelService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ITurboService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ITurboTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class TurboServiceImpl implements ITurboService {

    private static final String TURBO_MESSAGE = "Turbo";

    private final ITurboRepository turboRepository;

    private final ITurboTypeService turboTypeService;

    private final ILevelService levelService;

    private final MapperService mapperService;

    @Autowired
    public TurboServiceImpl(ITurboRepository turboRepository, ITurboTypeService turboTypeService, ILevelService levelService, MapperService mapperService) {
        this.turboRepository = turboRepository;
        this.turboTypeService = turboTypeService;
        this.levelService = levelService;
        this.mapperService = mapperService;
    }

    @Override
    @Cacheable(value = "turbos", key = "#id")
    public TurboDto getTurbo(Long id) {
        Turbo turbo = turboRepository.findByIdSpecific(id).orElseThrow(()-> new ResourceNotFoundException(TURBO_MESSAGE,id));
        return mapperService.convertToDto(turbo);
    }

    @Override
    public void createTurbo(TurboDto turboDto) {
        verifyDataExists(turboDto);
        if (turboRepository.existsTurbo(turboDto.getLevelDto().getId(),turboDto.getTurboTypeDto().getId())){
            throw new ResourceDuplicateException(TURBO_MESSAGE,"this");
        }
        Turbo turbo = mapperService.convertToEntity(turboDto);
        turboRepository.save(turbo);
    }

    @Override
    public void updateTurbo(Long id, TurboDto turboDto) {
        verifyDataExists(turboDto);
        verifyExists(id);
        turboDto.setId(id);
        Turbo turbo = mapperService.convertToEntity(turboDto);
        turboRepository.save(turbo);
    }

    @Override
    public void deleteTurbo(Long id) {
        verifyExists(id);
        turboRepository.deleteById(id);
    }

    @Override
    @Cacheable(value = "allTurbos")
    public List<TurboDto> getAllTurbos() {
        return turboRepository.findAll().stream().map(mapperService::convertToDto).toList();
    }

    private void verifyDataExists(TurboDto turboDto){
        TurboTypeDto turboTypeDto = turboTypeService.getTurboType(turboDto.getTurboTypeDto().getId());
        if (!turboTypeDto.equals(turboDto.getTurboTypeDto())){
            throw new DataNotFoundException(turboDto.getTurboTypeDto().getType());
        }
        LevelDto levelDto = levelService.getLevel(turboDto.getLevelDto().getId());
        if (!levelDto.equals(turboDto.getLevelDto())){
            throw new DataNotFoundException(turboDto.getLevelDto().getLevel());
        }
    }

    private void verifyExists(Long id){
        if (!turboRepository.existsById(id)){
            throw new ResourceNotFoundException(TURBO_MESSAGE,id);
        }
    }
}
