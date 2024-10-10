package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.LevelDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.ILevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/levels")
@Validated
public class LevelController {

    private final ILevelService levelService;

    @Autowired
    public LevelController(ILevelService levelService) {
        this.levelService = levelService;
    }

    @GetMapping("/{idLevel}")
    public ResponseEntity<LevelDto> getLevel(@PathVariable Long idLevel){
        LevelDto level = levelService.getLevel(idLevel);
        return ResponseEntity.ok(level);
    }

    @GetMapping("")
    public ResponseEntity<List<LevelDto>> getAllLevels(){
        return ResponseEntity.ok(levelService.getAllLevels());
    }

    @PostMapping("")
    public ResponseEntity<Void> createLevel(@RequestBody LevelDto levelDto){
        levelService.createLevel(levelDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idLevel}")
    public ResponseEntity<Void> updateLevel(@PathVariable Long idLevel, @RequestBody LevelDto levelDto){
        levelService.updateLevel(idLevel, levelDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idLevel}")
    public ResponseEntity<Void> deleteLevel(@PathVariable Long idLevel){
        levelService.deleteLevel(idLevel);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
