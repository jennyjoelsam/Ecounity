package com.ecounity.ecounity.service;


import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.Registration;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.repository.RegistrationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    public List<Registration> getRegistrationsByUser(User user) {
        return registrationRepository.findByUser(user);
    }

    public boolean isUserRegisteredForEvent(User user, Event event) {
        return registrationRepository.existsByUserAndEvent(user, event);
    }

    public List<Registration> getRegistrationsByEvent(Event event) {
        return registrationRepository.findByEvent(event);
    }
}