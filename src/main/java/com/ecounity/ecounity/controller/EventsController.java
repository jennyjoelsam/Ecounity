package com.ecounity.ecounity.controller;

import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.Registration;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.service.EventService;
import com.ecounity.ecounity.service.RegistrationService;
import com.ecounity.ecounity.utils.Base64Utils;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;  // Make sure to import necessary annotations and classes
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EventsController {

    private final EventService eventService;

    private final RegistrationService registrationService;

    @Autowired
    public EventsController(EventService eventService, RegistrationService registrationService) {
        this.eventService = eventService;
        this.registrationService = registrationService;
    }

    // Handler for displaying the Events page with the four buttons
    @GetMapping("/events")
    public String showEventsPage(Model model) {
        // Fetch events for each type
        List<Event> environmentalEvents = eventService.getEventsByType("Environmental Activities");
        List<Event> floodReliefEvents = eventService.getEventsByType("Flood Relief Events");
        List<Event> donationEvents = eventService.getEventsByType("Donation Events");
        List<Event> awarenessEvents = eventService.getEventsByType("Awareness Events");

        // Prepare event logo maps for each event type
        Map<Long, String> eventLogoMap = new HashMap<>();
        prepareEventLogos(environmentalEvents, eventLogoMap);
        prepareEventLogos(floodReliefEvents, eventLogoMap);
        prepareEventLogos(donationEvents, eventLogoMap);
        prepareEventLogos(awarenessEvents, eventLogoMap);

        // Add event lists to the model
        model.addAttribute("environmentalEvents", environmentalEvents);
        model.addAttribute("floodReliefEvents", floodReliefEvents);
        model.addAttribute("donationEvents", donationEvents);
        model.addAttribute("awarenessEvents", awarenessEvents);
        model.addAttribute("eventLogoMap", eventLogoMap);

        return "events"; // Name of your JSP view
    }

    // Helper method to prepare event logos and limit events to 4 per type
    private void prepareEventLogos(List<Event> events, Map<Long, String> eventLogoMap) {
        int count = 0;
        for (Event event : events) {
            if (count >= 4) {
                break; // Limit to 4 events per type
            }
            if (event.getLogo() != null) {
                String base64Logo = Base64Utils.encode(event.getLogo());
                eventLogoMap.put(event.getId(), base64Logo);
            }
            count++;
        }
    }


    // Handler for displaying events of a specific type
    @GetMapping(value = "/events", params = "type")
    public String showEventsByType(@RequestParam("type") String eventType, Model model) {
        // Fetch events by type from the service
//        System.out.println("in events type");
        List<Event> events = eventService.getEventsByType(eventType);

        model.addAttribute("events", events);
        model.addAttribute("eventType", eventType);
        return "specificEvent";
    }

    // Handler for displaying a specific event's details
    @GetMapping("/eventDescription")
    public String showEventDescription(@RequestParam("id") Long eventId, HttpSession session, Model model) {
        Event event = eventService.getEventById(eventId);
        if (event == null) {
            // Handle event not found
            return "events";
        }

        String base64Logo = null;
        if (event.getLogo() != null) {
            base64Logo = Base64Utils.encode(event.getLogo());
        }

        model.addAttribute("event", event);
        model.addAttribute("base64Logo", base64Logo);

        User user = (User) session.getAttribute("user");
        if (user != null) {
            boolean registered = registrationService.isUserRegisteredForEvent(user, event);
            model.addAttribute("registered", registered);

            if ("ecochamp".equals(user.getType()) || "admin".equals(user.getType())) {
                List<Registration> registrations = registrationService.getRegistrationsByEvent(event);
                model.addAttribute("registrations", registrations);
            }
        }

        return "eventDescription";
    }

    @PostMapping("/register")
    public String registerForEvent(
            @RequestParam Long eventId,
            @RequestParam Long userId,
            @RequestParam String userName,
            @RequestParam String userEmail,
            RedirectAttributes redirectAttributes) {

        try {
            eventService.registerUserForEvent(userId, eventId, userName, userEmail);
            redirectAttributes.addFlashAttribute("successMessage", "Registration successful!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Registration failed: " + e.getMessage());
        }
        return "redirect:/eventDescription?id=" + eventId; // Redirect back to the event description page
    }

//    @GetMapping("/eventsPage")
//    public String showEventsPage(Model model) {
//        // Existing code...
//
//        // Fetch environmental events
//        List<Event> environmentalEvents = eventService.getEventsByType("Environmental Activities");
//
//        // Prepare a map of event IDs to Base64-encoded logos
//        Map<Long, String> eventLogoMap = new HashMap<>();
//        int count = 0;
//        for (Event event : environmentalEvents) {
//            if (count >= 4) {
//                break; // Limit to 4 events
//            }
//            if (event.getLogo() != null) {
//                String base64Logo = Base64Utils.encode(event.getLogo());
//                eventLogoMap.put(event.getId(), base64Logo);
//            }
//            count++;
//        }
//
//        model.addAttribute("environmentalEvents", environmentalEvents);
//        model.addAttribute("eventLogoMap", eventLogoMap);
//
//        return "events"; // Name of your JSP view
//    }

    @GetMapping("/ecostore")
    public String showEcostore(Model model) {
        // If needed, add logic here to fetch any data you want displayed in ecostore.jsp
        // For example:
        // model.addAttribute("products", productService.getEcoProducts());
        return "ecostore";  // Return the name of JSP file (ecostore.jsp)
    }



}