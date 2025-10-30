package com.ecounity.ecounity.repository;

import com.ecounity.ecounity.model.CommunityPost;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommunityPostRepository extends JpaRepository<CommunityPost, Long> {
}