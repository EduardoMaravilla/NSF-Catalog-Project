package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.GearDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IGearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/gears")
@Validated
public class GearController {

    private final IGearService gearService;

    @Autowired
    public GearController(IGearService gearService) {
        this.gearService = gearService;
    }

    @GetMapping("/{idGear}")
    public ResponseEntity<GearDto> getGear(@PathVariable Long idGear) {
        GearDto gear = gearService.getGear(idGear);
        return ResponseEntity.ok(gear);
    }

    @GetMapping("")
    public ResponseEntity<List<GearDto>> getAllGears() {
        return ResponseEntity.ok(gearService.getAllGears());
    }

    @PostMapping("")
    public ResponseEntity<Void> createGear(@RequestBody GearDto gearDto) {
        gearService.createGear(gearDto);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idGear}")
    public ResponseEntity<Void> updateGear(@PathVariable Long idGear, @RequestBody GearDto gearDto) {
        gearService.updateGear(idGear, gearDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idGear}")
    public ResponseEntity<Void> deleteGear(@PathVariable Long idGear) {
        gearService.deleteGear(idGear);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
