package com.ecounity.ecounity.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private String transactionId;
    private Double amount;

    @Lob
    private byte[] screenshot; // Store image as byte array

    // Getters and setters
}