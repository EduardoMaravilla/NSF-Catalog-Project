package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TurboTypeDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ITurboTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/turbo-types")
@Validated
public class TurboTypeController {

    private final ITurboTypeService turboTypeService;

    @Autowired
    public TurboTypeController(ITurboTypeService turboTypeService) {
        this.turboTypeService = turboTypeService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<TurboTypeDto> getTurboTypeDto(@PathVariable Long id) {
        TurboTypeDto turboType = turboTypeService.getTurboType(id);
        return ResponseEntity.ok(turboType);
    }

    @GetMapping("")
    public ResponseEntity<List<TurboTypeDto>> getAllTurboTypes() {
        return ResponseEntity.ok(turboTypeService.getAllTurboTypes());
    }

    @PostMapping("")
    public ResponseEntity<Void> createTurboType(@RequestBody TurboTypeDto turboTypeDto) {
        turboTypeService.createTurboType(turboTypeDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> updateTurboType(@PathVariable Long id, @RequestBody TurboTypeDto turboTypeDto) {
        turboTypeService.updateTurboType(id, turboTypeDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTurboType(@PathVariable Long id) {
        turboTypeService.deleteTurboType(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
