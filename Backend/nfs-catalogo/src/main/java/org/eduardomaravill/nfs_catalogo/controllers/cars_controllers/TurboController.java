package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.TurboDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ITurboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/turbos")
@Validated
public class TurboController {

    private final ITurboService turboService;

    @Autowired
    public TurboController(ITurboService turboService) {
        this.turboService = turboService;
    }

    @GetMapping("/{idTurbo}")
    public ResponseEntity<TurboDto> getTurbo(@PathVariable Long idTurbo){
        TurboDto turbo = turboService.getTurbo(idTurbo);
        return ResponseEntity.ok(turbo);
    }

    @GetMapping("")
    public ResponseEntity<List<TurboDto>> getAllTurbos(){
        return ResponseEntity.ok(turboService.getAllTurbos());
    }

    @PostMapping("")
    public ResponseEntity<Void> createTurbo(@RequestBody TurboDto turboDto) {
        turboService.createTurbo(turboDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idTurbo}")
    public ResponseEntity<Void> updateTurbo(@PathVariable Long idTurbo, @RequestBody TurboDto turboDto) {
        turboService.updateTurbo(idTurbo, turboDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idTurbo}")
    public ResponseEntity<Void> deleteTurbo(@PathVariable Long idTurbo) {
        turboService.deleteTurbo(idTurbo);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
