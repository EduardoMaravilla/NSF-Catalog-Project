package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.MakerDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IMakerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/makers")
@Validated
public class MakerController {

    private final IMakerService makerService;

    @Autowired
    public MakerController(IMakerService makerService) {
        this.makerService = makerService;
    }

    @GetMapping("/{idMaker}")
    public ResponseEntity<MakerDto> getMaker(@PathVariable Long idMaker) {
        MakerDto maker = makerService.getMaker(idMaker);
        return ResponseEntity.ok(maker);
    }

    @GetMapping("")
    public ResponseEntity<List<MakerDto>> getAllMakers() {
        return ResponseEntity.ok(makerService.getAllMakers());
    }

    @PostMapping("")
    public ResponseEntity<Void> createMaker(@RequestBody MakerDto makerDto) {
        makerService.createMaker(makerDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idMaker}")
    public ResponseEntity<Void> updateMaker(@PathVariable Long idMaker, @RequestBody MakerDto makerDto) {
        makerService.updateMaker(idMaker, makerDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idMaker}")
    public ResponseEntity<Void> deleteMaker(@PathVariable Long idMaker) {
        makerService.deleteMaker(idMaker);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
