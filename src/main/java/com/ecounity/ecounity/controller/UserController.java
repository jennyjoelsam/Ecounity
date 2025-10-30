package com.ecounity.ecounity.controller;

import com.ecounity.ecounity.model.Registration;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.service.RegistrationService;
import com.ecounity.ecounity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private RegistrationService registrationService;



    @GetMapping("/signup")
    public String showSignupPage() {
        return "signup";
    }

    @PostMapping("/signup")
    public String registerUser(User user, Model model, HttpSession session) {
        try {
            User registeredUser = userService.registerUser(user);
            session.setAttribute("user", registeredUser); // Store user in session
            return "redirect:/events";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "signup";
        }
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        try {
            User user = userService.loginUser(email, password);
            session.setAttribute("user", user);
            return "redirect:/events";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }

    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/celebrate")
    public String celebrate(){
        return "celebrate";
    }


    @GetMapping("/profile")
    public String showUserProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<Registration> registrations = registrationService.getRegistrationsByUser(user);
        model.addAttribute("registrations", registrations);
        return "profile";
    }

    @PostMapping("/assignEcoCreds")
    public String assignEcoCreds(@RequestParam("participatedUsers") List<Long> participatedUserIds,
                                 @RequestParam("eventId") Long eventId,
                                 RedirectAttributes redirectAttributes) {
        try {
            userService.assignEcoCreds(participatedUserIds, 10, eventId); // Assign 10 EcoCreds
            redirectAttributes.addFlashAttribute("successMessage", "EcoCreds assigned successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to assign EcoCreds: " + e.getMessage());
        }
        return "redirect:/eventDescription?id=" + eventId;
    }

}