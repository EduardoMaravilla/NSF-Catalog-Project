package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.AuxiliarDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IAuxiliarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/auxiliaries")
@Validated
public class AuxiliarController {


    private final IAuxiliarService auxiliarService;

    @Autowired
    public AuxiliarController(IAuxiliarService auxiliarService) {
        this.auxiliarService = auxiliarService;
    }

    @GetMapping("/{idAuxiliary}")
    public ResponseEntity<AuxiliarDto> getAuxiliar(@PathVariable Long idAuxiliary){
        AuxiliarDto auxiliar = auxiliarService.getAuxiliar(idAuxiliary);
        return ResponseEntity.ok(auxiliar);
    }

    @GetMapping("")
    public ResponseEntity<List<AuxiliarDto>> getAllAuxiliaries(){
        return ResponseEntity.ok(auxiliarService.getAllAuxiliaries());
    }

    @PostMapping("")
    public ResponseEntity<Void> createAuxiliar(@RequestBody AuxiliarDto auxiliarDto){
        auxiliarService.createAuxiliar(auxiliarDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idAuxiliary}")
    public ResponseEntity<Void> updateAuxiliar(@PathVariable Long idAuxiliary, @RequestBody AuxiliarDto auxiliarDto) {
        auxiliarService.updateAuxiliar(idAuxiliary, auxiliarDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idAuxiliary}")
    public ResponseEntity<Void> deleteAuxiliar(@PathVariable Long idAuxiliary) {
        auxiliarService.deleteAuxiliar(idAuxiliary);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
