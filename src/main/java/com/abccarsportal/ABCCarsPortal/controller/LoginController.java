package com.abccarsportal.ABCCarsPortal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.abccarsportal.ABCCarsPortal.dao.User;


@Controller
public class LoginController {
	
	@GetMapping(value = "/login")
	public String showLoginForm(Model model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@GetMapping("/login_error")
	public String onLoginError(Model model) {
		String error_msg = "Incorrect username or password. Please re-enter.";
		model.addAttribute("error_string", error_msg);
		return "login";
	}
	

}
