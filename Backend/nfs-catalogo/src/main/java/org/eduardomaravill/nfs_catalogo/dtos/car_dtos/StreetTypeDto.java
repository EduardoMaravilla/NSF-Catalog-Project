package org.eduardomaravill.nfs_catalogo.dtos.car_dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StreetTypeDto {
    private Long id;

    @Size(max = 20)
    @NotBlank
    private String streetTypeVal;
}