package com.ecounity.ecounity.service;

import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.Registration;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.repository.EventRepository;
import com.ecounity.ecounity.repository.RegistrationRepository;

import com.ecounity.ecounity.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    private final EventRepository eventRepository;
    private final UserRepository userRepository;
    private final RegistrationRepository registrationRepository;

    @Autowired
    public EventServiceImpl(EventRepository eventRepository, RegistrationRepository registrationRepository, UserRepository userRepository) {
        this.eventRepository = eventRepository;
        this.registrationRepository = registrationRepository;
        this.userRepository = userRepository;
    }


    @Override
    public void saveEvent(Event event, MultipartFile logoFile) {
        // Handle the uploaded logo file if provided
        if (logoFile != null && !logoFile.isEmpty()) {
            try {
                event.setLogo(logoFile.getBytes());
            } catch (IOException e) {
                // You can log the error or throw a custom exception as needed
                e.printStackTrace();
            }
        }
        // Save the event using the repository
        eventRepository.save(event);
    }

//    Events--------------------------------------
    @Override
    public List<Event> getEventsByType(String eventType) {
        return eventRepository.findByEventType(eventType);
    }

    @Override
    public Event getEventById(Long eventId) {
        return eventRepository.findById(eventId).orElseThrow(() -> new RuntimeException("Event not found"));
    }

    public void registerUserForEvent(Long userId, Long eventId, String userName, String userEmail) {
        Event event = eventRepository.findById(eventId).orElseThrow(() -> new RuntimeException("Event not found"));
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));

        if (event.getNoOfRegistrations() < event.getRegistrationsAllowed()) {
            Registration registration = new Registration();
            registration.setUser(user); // Use the fetched User entity
            registration.setEvent(event);
            registration.setUserName(userName);
            registration.setUserEmail(userEmail);
            registrationRepository.save(registration);

            event.setNoOfRegistrations(event.getNoOfRegistrations() + 1);
            eventRepository.save(event);
        } else {
            throw new RuntimeException("Event is fully booked");
        }
    }


}
