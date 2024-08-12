package com.abccarsportal.ABCCarsPortal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AboutusContactusController {
	
	@GetMapping("/aboutus")
	public String getAboutusPage() {
		return "aboutus";
	}
	
	@GetMapping("/contactus")
	public String getContactusPage() {
		return "contactus";
	}

}
