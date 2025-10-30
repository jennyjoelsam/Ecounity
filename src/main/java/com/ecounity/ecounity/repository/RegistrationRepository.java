package com.ecounity.ecounity.repository;

import com.ecounity.ecounity.model.Event;
import com.ecounity.ecounity.model.Registration;
import com.ecounity.ecounity.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RegistrationRepository extends JpaRepository<Registration, Long> {
    List<Registration> findByUser(User user);
    List<Registration> findByEvent(Event event);
    boolean existsByUserAndEvent(User user, Event event);
}
