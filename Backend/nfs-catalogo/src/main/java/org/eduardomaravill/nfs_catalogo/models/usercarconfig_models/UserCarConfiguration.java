package org.eduardomaravill.nfs_catalogo.models.usercarconfig_models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.eduardomaravill.nfs_catalogo.models.cars_models.CarConfiguration;
import org.eduardomaravill.nfs_catalogo.models.users_models.User;

@Entity
@Table(name = "user_car_configurations")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserCarConfiguration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_user_car_configurations")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id",nullable = false)
    @NotNull
    private User user;

    @ManyToOne
    @JoinColumn(name = "car_configuration_id",nullable = false)
    @NotNull
    private CarConfiguration carConfiguration;
}