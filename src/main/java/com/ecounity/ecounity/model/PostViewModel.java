package com.ecounity.ecounity.model;

public class PostViewModel {
    private Long postId;
    private String userName;
    private String description;
    private String imageBase64;
    private int likesCount;

    // Constructor
    public PostViewModel(Long postId, String userName, String description, String imageBase64, int likesCount) {
        this.postId = postId;
        this.userName = userName;
        this.description = description;
        this.imageBase64 = imageBase64;
        this.likesCount = likesCount;
    }

    // Getters and setters
    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageBase64() {
        return imageBase64;
    }

    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

    public int getLikesCount() {
        return likesCount;
    }

    public void setLikesCount(int likesCount) {
        this.likesCount = likesCount;
    }
}