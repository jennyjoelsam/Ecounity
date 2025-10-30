package com.ecounity.ecounity.controller;
import com.ecounity.ecounity.model.CommunityPost;
import com.ecounity.ecounity.model.PostViewModel;
import com.ecounity.ecounity.model.User;
import com.ecounity.ecounity.service.CommunityPostService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;


@Controller
public class CommunityPostController {

    @Autowired
    private CommunityPostService communityPostService;

    @GetMapping("/community")
    public String showUploadForm(Model model) {
        List<PostViewModel> postViewModels = communityPostService.getAllPostViewModels();
        model.addAttribute("posts", postViewModels);
        return "upload"; // This will map to upload.jsp
    }

    @PostMapping("/community")
    public String handleLike(@RequestParam("postId") Long postId) {
        communityPostService.incrementLikeCount(postId);
        return "redirect:/community"; // Redirect to refresh the page and show updated like count
    }

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("image") MultipartFile file,
                                   @RequestParam("description") String description,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        try {
            // Retrieve the user object from the session
            User user = (User) session.getAttribute("user");
            if (user == null) {
                redirectAttributes.addFlashAttribute("message", "User not logged in.");
                return "redirect:/login"; // Redirect to login if user is not in session
            }

            Long userId = user.getId(); // Assuming User object has a getId() method

            communityPostService.savePost(file, description, userId);
            redirectAttributes.addFlashAttribute("message", "Post uploaded successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload post.");
        }
        return "redirect:/community";
    }
}
