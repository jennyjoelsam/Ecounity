package com.ecounity.ecounity.controller;

import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.service.EventService;
import com.ecounity.ecounity.service.EventServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/eventupload")
public class EventUploadController {

    private final EventServiceImpl eventServiceImpl;

    @Autowired
    public EventUploadController(EventServiceImpl eventServiceImpl) {
        this.eventServiceImpl = eventServiceImpl;
    }

    // Display the event upload form
    @GetMapping
    public String showEventForm(Model model) {
        model.addAttribute("Event", new Event());
        return "eventupload"; // Corresponds to eventupload.jsp
    }

    // Handle form submission
//    @PostMapping
//    public String handleEventUpload(@ModelAttribute("Event") Event event,
//                                    @RequestParam("logo") MultipartFile logoFile) {
    @PostMapping
    public String handleEventUpload(
            @RequestParam("eventType") String eventType,
            @RequestParam("eventTitle") String eventTitle,
            @RequestParam("visibility") String visibility,
            @RequestParam("organization") String organization,
            @RequestParam("website") String website,
            @RequestParam("festival") String festival,
            @RequestParam("mode") String mode,
            @RequestParam("categories") String categories,
            @RequestParam("registrationStart") String registrationStart,
            @RequestParam("registrationEnd") String registrationEnd,
            @RequestParam("organizer1") String organizer1,
            @RequestParam("organizer1Email") String organizer1Email,
            @RequestParam("organizer1Contact") String organizer1Contact,
            @RequestParam("organizer2") String organizer2,
            @RequestParam("organizer2Email") String organizer2Email,
            @RequestParam("organizer2Contact") String organizer2Contact,
            @RequestParam("registrationsAllowed") Integer registrationsAllowed,
            @RequestParam("logo") MultipartFile logoFile,
            @RequestParam("details") String details,
            HttpSession session) {

        User user = (User) session.getAttribute("user"); // Get the logged-in user
        if (user == null) {
            return "redirect:/login"; // Redirect to login if user is not logged in
        }

        Event event = new Event();
        event.setEventType(eventType);
        event.setEventTitle(eventTitle);
        event.setVisibility(visibility);
        event.setOrganization(organization);
        event.setWebsite(website);
        event.setFestival(festival);
        event.setMode(mode);
        event.setCategories(categories);
        event.setDetails(details);
        event.setRegistrationStart(LocalDateTime.parse(registrationStart));
        event.setRegistrationEnd(LocalDateTime.parse(registrationEnd));
        event.setOrganizer1(organizer1);
        event.setOrganizer1Email(organizer1Email);
        event.setOrganizer1Contact(organizer1Contact);
        event.setOrganizer2(organizer2);
        event.setOrganizer2Email(organizer2Email);
        event.setOrganizer2Contact(organizer2Contact);
        event.setRegistrationsAllowed(registrationsAllowed);
        event.setUserId(user.getId()); // Set the user ID

        eventServiceImpl.saveEvent(event, logoFile);

        return "redirect:/events"; // Redirect to events page after successful upload
    }

}
