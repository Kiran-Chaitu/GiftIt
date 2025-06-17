package com.swarup.repudation_service.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "reputation_history")
@Getter
@Setter
@NoArgsConstructor
public class reputationHistoryModel {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "points_change", nullable = false)
    private int pointsChange;

    @Column(name = "reason_code")
    private String reasonCode;

    @Column(name = "related_donation_id", nullable = false)
    private Long relatedDonationId;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    public reputationHistoryModel(Long userId, int pointsChange, String reasonCode, Long relatedDonationId) {
        this.userId = userId;
        this.pointsChange = pointsChange;
        this.reasonCode = reasonCode;
        this.relatedDonationId = relatedDonationId;
        this.createdAt = LocalDateTime.now();
    }
}
