package com.swarup.repudation_service.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigInteger;
import java.time.LocalDateTime;

@Entity
@Table(name = "user_repudations")
@Getter
@Setter
@NoArgsConstructor
public class UserReputationModel {

    @Id
    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "current_points", nullable = false)
    private int currentPoints;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    UserReputationModel(Long userId, int currentPoints) {
        this.userId = userId;
        this.currentPoints = currentPoints;
        this.createdAt = LocalDateTime.now();
    }

}
