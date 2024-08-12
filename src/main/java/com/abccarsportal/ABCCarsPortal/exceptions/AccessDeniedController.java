package com.abccarsportal.ABCCarsPortal.exceptions;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AccessDeniedController {
	
	@GetMapping("/access-denied")
	public String getAccessDeniedPage() {
		return "access-denied";
	}
	
	@GetMapping("/accessdeniedsession")
	public String getAccessDeniedSessionPage() {
		return "accessdeniedsession";
	}
	

}
