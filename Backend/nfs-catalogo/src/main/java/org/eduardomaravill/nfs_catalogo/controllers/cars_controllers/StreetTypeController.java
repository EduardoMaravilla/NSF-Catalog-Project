package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.StreetTypeDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IStreetTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/street-types")
@Validated
public class StreetTypeController {

    private final IStreetTypeService streetTypeService;

    @Autowired
    public StreetTypeController(IStreetTypeService streetTypeService) {
        this.streetTypeService = streetTypeService;
    }

    @GetMapping("/{idStreetType}")
    public ResponseEntity<StreetTypeDto> getStreetType(@PathVariable Long idStreetType){
        StreetTypeDto streetTypeDto = streetTypeService.getStreetType(idStreetType);
        return ResponseEntity.ok(streetTypeDto);
    }

    @GetMapping("")
    public ResponseEntity<List<StreetTypeDto>> getAllStreetTypes(){
        return ResponseEntity.ok(streetTypeService.getAllStreetTypes());
    }

    @PostMapping("")
    public ResponseEntity<Void> createStreetType(@RequestBody StreetTypeDto streetTypeDto){
        streetTypeService.createStreetType(streetTypeDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idStreetType}")
    public ResponseEntity<Void> updateStreetType(@PathVariable Long idStreetType, @RequestBody StreetTypeDto streetTypeDto){
        streetTypeService.updateStreetType(idStreetType, streetTypeDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idStreetType}")
    public ResponseEntity<Void> deleteStreetType(@PathVariable Long idStreetType){
        streetTypeService.deleteStreetType(idStreetType);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
