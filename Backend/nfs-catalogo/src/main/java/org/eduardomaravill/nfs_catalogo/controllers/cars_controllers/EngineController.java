package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.EngineDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IEngineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/engines")
@Validated
public class EngineController {

    private final IEngineService engineService;

    @Autowired
    public EngineController(IEngineService engineService) {
        this.engineService = engineService;
    }

    @GetMapping("/{idEngine}")
    public ResponseEntity<EngineDto> getEngine(@PathVariable Long idEngine){
        EngineDto engineDto = engineService.getEngine(idEngine);
        return ResponseEntity.ok(engineDto);
    }

    @GetMapping("")
    public ResponseEntity<List<EngineDto>> getAllEngines(){
        return ResponseEntity.ok(engineService.getAllEngines());
    }

    @PostMapping("")
    public ResponseEntity<Void> createEngine(@RequestBody EngineDto engineDto){
        engineService.createEngine(engineDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idEngine}")
    public ResponseEntity<Void> updateEngine(@PathVariable Long idEngine, @RequestBody EngineDto engineDto){
        engineService.updateEngine(idEngine, engineDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idEngine}")
    public ResponseEntity<Void> deleteEngine(@PathVariable Long idEngine){
        engineService.deleteEngine(idEngine);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
