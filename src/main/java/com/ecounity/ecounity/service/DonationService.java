package com.ecounity.ecounity.service;

import com.ecounity.ecounity.model.Donation;
import com.ecounity.ecounity.repository.DonationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    public Donation saveDonation(Long userId, String transactionId, Double amount, MultipartFile screenshot) throws IOException {
        // Convert image to byte array
        byte[] screenshotBytes = screenshot.getBytes();

        // Create and save the donation
        Donation donation = new Donation();
        donation.setUserId(userId);
        donation.setTransactionId(transactionId);
        donation.setAmount(amount);
        donation.setScreenshot(screenshotBytes);

        return donationRepository.save(donation);
    }

    public List<Donation> getAllDonations() {
        return donationRepository.findAll();
    }

}