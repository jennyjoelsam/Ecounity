package com.ecounity.ecounity.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.Data;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "events")
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    private byte[] logo;

    @NotEmpty(message = "Event type cannot be empty")
    private String eventType;

    @NotEmpty(message = "Event title cannot be empty")
    private String eventTitle;

    @NotEmpty(message = "Visibility is required")
    private String visibility;

    @NotEmpty(message = "Organization cannot be empty")
    private String organization;

    @NotEmpty(message = "Website cannot be empty")
    private String website;

    private String festival;
    private String mode;
    private String categories;

    @Lob
    private String details;

    @NotNull(message = "Registration start time is required")
    private LocalDateTime registrationStart;

    @NotNull(message = "Registration end time is required")
    private LocalDateTime registrationEnd;

    @NotEmpty(message = "Organizer 1 name cannot be empty")
    private String organizer1;

    @Email(message = "Organizer 1 email must be valid")
    private String organizer1Email;

    @NotEmpty(message = "Organizer 1 contact cannot be empty")
    private String organizer1Contact;

    private String organizer2;

    @Email(message = "Organizer 2 email must be valid")
    private String organizer2Email;

    private String organizer2Contact;

    @Min(value = 1, message = "Registrations allowed must be at least 1")
    private Integer registrationsAllowed;

    @Column(nullable = false)
    private int noOfRegistrations = 0;

    @Column(nullable = false)
    private Long userId;

    private int flag;
}