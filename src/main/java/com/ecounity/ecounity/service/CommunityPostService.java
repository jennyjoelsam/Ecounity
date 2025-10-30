package com.ecounity.ecounity.service;

import com.ecounity.ecounity.model.CommunityPost;
import com.ecounity.ecounity.model.PostViewModel;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.repository.CommunityPostRepository;
import com.ecounity.ecounity.repository.UserRepository;
import com.ecounity.ecounity.utils.Base64Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class CommunityPostService {

    @Autowired
    private CommunityPostRepository communityPostRepository;

    @Autowired
    private UserRepository userRepository;
    public void savePost(MultipartFile file, String description, Long userId) throws IOException {
        // Convert file to byte array
        byte[] logoBytes = file.getBytes();

        // Create a new post
        CommunityPost post = new CommunityPost();
        post.setDescription(description);
        post.setLogo(logoBytes);
        post.setLikesCount(0);
        post.setUserId(userId);

        // Save to the database
        communityPostRepository.save(post);
    }

    public int incrementLikeCount(Long postId) {
        CommunityPost post = communityPostRepository.findById(postId).orElseThrow();
        post.setLikesCount(post.getLikesCount() + 1);
        communityPostRepository.save(post);
        return post.getLikesCount();
    }

    public List<CommunityPost> getAllPosts() {
        return communityPostRepository.findAll();
    }

    public List<PostViewModel> getAllPostViewModels() {
        List<CommunityPost> posts = communityPostRepository.findAll();
        List<PostViewModel> postViewModels = new ArrayList<>();

        for (CommunityPost post : posts) {
            User user = userRepository.findById(post.getUserId()).orElse(null);
            String userName = (user != null) ? user.getFullName() : "Unknown User";
            String imageBase64 = Base64Utils.encode(post.getLogo());

            PostViewModel postViewModel = new PostViewModel(
                    post.getId(),
                    userName,
                    post.getDescription(),
                    imageBase64,
                    post.getLikesCount()
            );

            postViewModels.add(postViewModel);
        }

        return postViewModels;
    }
}