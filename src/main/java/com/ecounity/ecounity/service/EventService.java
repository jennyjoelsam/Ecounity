package com.ecounity.ecounity.service;

import com.ecounity.ecounity.model.Event;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface EventService {
    void saveEvent(Event event, MultipartFile logoFile);
    List<Event> getEventsByType(String eventType);
    Event getEventById(Long id);

    void registerUserForEvent(Long userId, Long eventId, String userName, String userEmail);
}
