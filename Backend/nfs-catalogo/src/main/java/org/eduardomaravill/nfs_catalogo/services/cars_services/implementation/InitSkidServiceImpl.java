package org.eduardomaravill.nfs_catalogo.services.cars_services.implementation;

import jakarta.transaction.Transactional;
import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.InitSkidDto;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceDuplicateException;
import org.eduardomaravill.nfs_catalogo.exceptions.ResourceNotFoundException;
import org.eduardomaravill.nfs_catalogo.models.cars_models.InitSkid;
import org.eduardomaravill.nfs_catalogo.repositories.cars_repositories.IInitSkidRepository;
import org.eduardomaravill.nfs_catalogo.services.MapperService;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IInitSkidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public class InitSkidServiceImpl implements IInitSkidService {

    private static final String INIT_SKID_MESSAGE = "InitSkid";

    private final IInitSkidRepository initSkidRepository;

    private final MapperService mapperService;

    @Autowired
    public InitSkidServiceImpl(IInitSkidRepository initSkidRepository, MapperService mapperService) {
        this.initSkidRepository = initSkidRepository;
        this.mapperService = mapperService;
    }

    @Override
    @Cacheable(value = "initSkid", key = "#id")
    public InitSkidDto getInitSkid(Long id) {
        InitSkid initSkid = initSkidRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException(INIT_SKID_MESSAGE, id));
        return mapperService.convertToDto(initSkid);
    }

    @Override
    public void createInitSkid(InitSkidDto initSkidDto) {
        if (initSkidRepository.existsByName(initSkidDto.getSkidType())) {
            throw new ResourceDuplicateException(INIT_SKID_MESSAGE, initSkidDto.getSkidType());
        }
        InitSkid initSkid = mapperService.convertToEntity(initSkidDto);
        initSkidRepository.save(initSkid);
    }

    @Override
    public void updateInitSkid(Long id, InitSkidDto initSkidDto) {
        verifyExists(id);
        initSkidDto.setId(id);
        InitSkid initSkid = mapperService.convertToEntity(initSkidDto);
        initSkidRepository.save(initSkid);
    }

    @Override
    public void deleteInitSkid(Long id) {
        verifyExists(id);
        initSkidRepository.deleteById(id);
    }

    @Override
    @Cacheable(value = "allInitSkids")
    public List<InitSkidDto> getAllInitSkids() {
        return initSkidRepository.findAll().stream().map(mapperService::convertToDto).toList();
    }

    private void verifyExists(Long id){
        if (!initSkidRepository.existsById(id)) {
            throw new ResourceNotFoundException(INIT_SKID_MESSAGE, id);
        }
    }
}