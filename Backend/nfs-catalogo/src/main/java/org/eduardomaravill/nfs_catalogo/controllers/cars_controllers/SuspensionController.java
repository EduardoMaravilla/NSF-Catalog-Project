package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.SuspensionDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ISuspensionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/suspensions")
@Validated
public class SuspensionController {

    private final ISuspensionService suspensionService;

    @Autowired
    public SuspensionController(ISuspensionService suspensionService) {
        this.suspensionService = suspensionService;
    }

    @GetMapping("/{idSuspension}")
    public ResponseEntity<SuspensionDto> getSuspension(@PathVariable Long idSuspension){
        SuspensionDto suspension = suspensionService.getSuspension(idSuspension);
        return ResponseEntity.ok(suspension);
    }

    @GetMapping("")
    public ResponseEntity<List<SuspensionDto>> getAllSuspensions(){
        return ResponseEntity.ok(suspensionService.getAllSuspensions());
    }

    @PostMapping("")
    public ResponseEntity<Void> createSuspension(@RequestBody SuspensionDto suspensionDto){
        suspensionService.createSuspension(suspensionDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idSuspension}")
    public ResponseEntity<Void> updateSuspension(@PathVariable Long idSuspension, @RequestBody SuspensionDto suspensionDto){
        suspensionService.updateSuspension(idSuspension, suspensionDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idSuspension}")
    public ResponseEntity<Void> deleteSuspension(@PathVariable Long idSuspension){
        suspensionService.deleteSuspension(idSuspension);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
