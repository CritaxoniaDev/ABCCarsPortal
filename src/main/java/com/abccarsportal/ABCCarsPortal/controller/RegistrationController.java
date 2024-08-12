package com.abccarsportal.ABCCarsPortal.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.abccarsportal.ABCCarsPortal.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegistrationController {

	@Autowired
	private UserService userService;

	@GetMapping(value = "/registration")
	public String getRegistrationPage() {
		return "registration";
	}

	@PostMapping(value = "/registration")
	public ModelAndView registerUser(@RequestParam String name, @RequestParam String userName,
			@RequestParam String email, @RequestParam String phoneNumber, @RequestParam String password,
			HttpSession session, RedirectAttributes redirectAttributes) {

		if (userService.emailExists(email)) {
			ModelAndView mav = new ModelAndView("registration");
			mav.addObject("error", "Email already exists, Try Again!");
			return mav;
		}

		Date registrationDate = new Date();

		userService.registerUser(name, userName, email, phoneNumber, password, registrationDate);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("confirmation");
		return mav;
	}

}
