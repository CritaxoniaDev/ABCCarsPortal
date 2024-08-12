package com.abccarsportal.ABCCarsPortal.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.ProfilePicture;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.service.CarService;
import com.abccarsportal.ABCCarsPortal.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProfileController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CarService carService;
	
	@GetMapping("/userprofile")
	public String getUserProfile(Model model, HttpSession session, Authentication authentication) {
	    String username = authentication.getName();
	    User user = userService.findByUserName(username);

	    if (user != null && user.getProfilePicture() != null) {
	        // Initialize the lazy-loaded profile picture
	        ProfilePicture profilePicture = user.getProfilePicture();
	        profilePicture.getImage(); // Load profile picture data from database

	        // Add the profile picture object to the model
	        model.addAttribute("profilePicture", profilePicture);
	    }

	    // Add the user object to the model
	    model.addAttribute("user", user);

	    // Retrieve the cars posted by the user
	    List<Car> postedCars = carService.getPostedCarsByUser(user);
	    // Add the posted cars to the model
	    model.addAttribute("postedCars", postedCars);

	    return "userprofile";
	}
    
    @GetMapping("/editprofile")
    public String getEditProfilePage(Model model, Authentication authentication) {
        // Get the currently authenticated user's username
        String username = authentication.getName();

        // Fetch the user details from the database
        User user = userService.findByUserName(username);

        // Add user details to the model
        model.addAttribute("user", user);

        return "editprofile";
    }
    
    @PostMapping("/editprofile")
    public String editProfile(@ModelAttribute("user") User user,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
    	try {
            // Call your service method to update the user with the modified details
            userService.updateUser(user);

            // Set any additional attributes or messages for the view
            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully");
        } catch (Exception e) {
            // Handle any exceptions
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update profile");
            e.printStackTrace();
        }
        // Redirect to a suitable view
        return "redirect:/userprofile";
    }
    
    @GetMapping("/updateprofilepicture")
    public String getUploadProfilePage() {
        return "updateprofilepicture";
    }
    
    @PostMapping("/uploadProfilePicture")
    public String uploadProfilePicture(@RequestParam("profilePicture") MultipartFile profilePicture,
                                       Principal principal) {
        try {
            // Retrieve the currently logged-in user
            String username = principal.getName();
            User currentUser = userService.findByUserName(username);
            
            // Call your service method to handle the profile picture upload
            userService.saveImage(profilePicture, currentUser);
            
            // Redirect to the user profile page after successful upload
            return "redirect:/userprofile";
        } catch (Exception e) {
            e.printStackTrace();
            // You can add a flash attribute or model attribute to display an error message on the profile page
            return "redirect:/userprofile"; // Redirect back to the user profile page
        }
    }
   
}
