package org.eduardomaravill.nfs_catalogo.controllers.cars_controllers;

import org.eduardomaravill.nfs_catalogo.dtos.car_dtos.ClassesDto;
import org.eduardomaravill.nfs_catalogo.services.cars_services.IClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/classes")

@Validated
public class ClassesController {

    private final IClassesService classesService;

    @Autowired
    public ClassesController(IClassesService classesService) {
        this.classesService = classesService;
    }

    @GetMapping("/{idClasses}")
    public ResponseEntity<ClassesDto> getClasses(@PathVariable Long idClasses) {
        ClassesDto classes = classesService.getClasses(idClasses);
        return ResponseEntity.ok(classes);
    }

    @GetMapping("")
    public ResponseEntity<List<ClassesDto>> getAllClasses() {
        return ResponseEntity.ok(classesService.getAllClasses());
    }

    @PostMapping("")
    public ResponseEntity<Void> createClass(@RequestBody ClassesDto classes) {
        classesService.createClass(classes);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/{idClasses}")
    public ResponseEntity<Void> updateClass(@PathVariable Long idClasses, @RequestBody ClassesDto classesDto) {
        classesService.updateClass(idClasses, classesDto);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{idClasses}")
    public ResponseEntity<Void> deleteClass(@PathVariable Long idClasses) {
        classesService.deleteClass(idClasses);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
