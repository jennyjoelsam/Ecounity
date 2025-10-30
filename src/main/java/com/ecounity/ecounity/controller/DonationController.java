package com.ecounity.ecounity.controller;

import com.ecounity.ecounity.model.Donation;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.service.DonationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;

    @GetMapping("/donate")
    public String showDonationPage(Model model) {
        // Fetch all donations for admin or ecochamp
        List<Donation> donations = donationService.getAllDonations();
        System.out.print(donations);
        model.addAttribute("donations", donations);
        return "donateatree"; // Return the name of the JSP page
    }

    @PostMapping("/donate")
    public String handleDonation(
            @RequestParam String transactionId,
            @RequestParam Double amount,
            @RequestParam MultipartFile screenshot,
            HttpSession session,
            Model model) {
        User user = (User)session.getAttribute("user");
        Long userId = user.getId();

        try {
            donationService.saveDonation(userId, transactionId, amount, screenshot);
            model.addAttribute("success", "Donation successful!");
        } catch (IOException e) {
            model.addAttribute("error", "Failed to process donation.");
        }

        return "redirect:/donateatree";
    }

    // Helper method to convert byte array to Base64 string
    public String convertToBase64(byte[] image) {
        return Base64.getEncoder().encodeToString(image);
    }
}