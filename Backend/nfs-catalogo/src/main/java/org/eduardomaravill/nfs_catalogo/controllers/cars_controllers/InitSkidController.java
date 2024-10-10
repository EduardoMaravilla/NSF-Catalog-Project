package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.InitSkidDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IInitSkidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/init-skids")
@Validated
public class InitSkidController {

    private final IInitSkidService initSkidService;

    @Autowired
    public InitSkidController(IInitSkidService initSkidService) {
        this.initSkidService = initSkidService;
    }

    @GetMapping("/{idInitSkid}")
    public ResponseEntity<InitSkidDto> getInitSkid(@PathVariable Long idInitSkid){
        InitSkidDto initSkid = initSkidService.getInitSkid(idInitSkid);
        return ResponseEntity.ok(initSkid);
    }

    @GetMapping("")
    public ResponseEntity<List<InitSkidDto>> getAllInitSkids(){
        return ResponseEntity.ok(initSkidService.getAllInitSkids());
    }

    @PostMapping("")
    public ResponseEntity<Void> createInitSkid(@RequestBody InitSkidDto initSkidDto){
        initSkidService.createInitSkid(initSkidDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idInitSkid}")
    public ResponseEntity<Void> updateInitSkid(@PathVariable Long idInitSkid, @RequestBody InitSkidDto initSkidDto){
        initSkidService.updateInitSkid(idInitSkid, initSkidDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idInitSkid}")
    public ResponseEntity<Void> deleteInitSkid(@PathVariable Long idInitSkid){
        initSkidService.deleteInitSkid(idInitSkid);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
