package com.ecounity.ecounity.service;

import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.repository.EventRepository;
import com.ecounity.ecounity.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private EventRepository eventRepository;

    public User registerUser(User user) throws Exception {
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            throw new Exception("User already exists");
        }
        return userRepository.save(user);
    }

    public User loginUser(String email, String password) throws Exception {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new Exception("User not found"));
        if (!user.getPassword().equals(password)) {
            throw new Exception("Invalid credentials");
        }
        return user;
    }


    public void assignEcoCreds(List<Long> userIds, int ecoCreds, Long eventId) {
        for (Long userId : userIds) {
            User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
            user.setEcoCreds(user.getEcoCreds() + ecoCreds);
            userRepository.save(user);
        }

        // Update the event flag to indicate completion
        Event event = eventRepository.findById(eventId).orElseThrow(() -> new RuntimeException("Event not found"));
        event.setFlag(1); // Set flag to 1 to indicate the event is completed
        eventRepository.save(event);
    }


}