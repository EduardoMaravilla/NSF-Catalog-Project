package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TireDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ITireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/tires")
@Validated
public class TireController {

    private final ITireService tireService;

    @Autowired
    public TireController(ITireService tireService) {
        this.tireService = tireService;
    }

    @GetMapping("/{idTire}")
    public ResponseEntity<TireDto> getTire(@PathVariable Long idTire){
        TireDto tire = tireService.getTire(idTire);
        return ResponseEntity.ok(tire);
    }

    @GetMapping("")
    public ResponseEntity<List<TireDto>> getAllTires(){
        return ResponseEntity.ok(tireService.getAllTires());
    }

    @PostMapping("")
    public ResponseEntity<Void> createTire(@RequestBody TireDto tireDto){
        tireService.createTire(tireDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idTire}")
    public ResponseEntity<Void> updateTire(@PathVariable Long idTire, @RequestBody TireDto tireDto){
        tireService.updateTire(idTire, tireDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idTire}")
    public ResponseEntity<Void> deleteTire(@PathVariable Long idTire){
        tireService.deleteTire(idTire);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
