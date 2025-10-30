package com.ecounity.ecounity.repository;

import com.ecounity.ecounity.model.Donation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    // Additional query methods if needed
}