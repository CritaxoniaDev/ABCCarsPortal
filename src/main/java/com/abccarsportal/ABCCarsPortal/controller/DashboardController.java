package com.abccarsportal.ABCCarsPortal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.service.CarService;
import com.abccarsportal.ABCCarsPortal.service.UserService;

@Controller
public class DashboardController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CarService carService;

	@GetMapping("/dashboard")
	public String getDashboardPage(Model model) {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();

	    // Find the user by username
	    User user = userService.findByUserName(username);
	    
	    // Retrieve the list of cars from the database with eagerly fetched User objects
	    List<Car> cars = carService.getAllCarsWithUsers();
	    
	    model.addAttribute("name", user.getName());
	    
	    // Add the user's name to the model
	    model.addAttribute("userName", username);
	    // Add the list of cars to the model
	    model.addAttribute("cars", cars);
	    // Return the dashboard.jsp view
	    return "dashboard";
	}
}
