package com.ecounity.ecounity.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    @Email(message = "Email should be valid")
    @NotBlank(message = "Email is mandatory")
    private String email;

    @NotBlank(message = "Full name is mandatory")
    private String fullName;

    @NotBlank(message = "Password is mandatory")
    private String password;

    @NotBlank(message = "Phone number is mandatory")
    private String phoneNumber;

    @NotBlank(message = "Birth date is mandatory")
    private String birthDate;

    @NotBlank(message = "Gender is mandatory")
    private String gender;

    @NotBlank(message = "Address is mandatory")
    private String address;

    @NotBlank(message = "City is mandatory")
    private String city;

    @NotBlank(message = "Region is mandatory")
    private String region;

    @NotBlank(message = "Postal code is mandatory")
    private String postalCode;

    @Column(nullable = false)
    private int ecoCreds = 0; // Initialize with a default value


    @NotBlank(message = "User type is mandatory")
    private String type = "generaluser"; // Default to generaluser
}