package com.ecounity.ecounity.repository;


import com.ecounity.ecounity.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByEventType(String eventType);
}
