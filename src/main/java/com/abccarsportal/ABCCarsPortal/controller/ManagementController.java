package com.abccarsportal.ABCCarsPortal.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.CarBidding;
import com.abccarsportal.ABCCarsPortal.dao.CarTestDrive;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.exceptions.BidNotFoundException;
import com.abccarsportal.ABCCarsPortal.exceptions.TestDriveNotFoundException;
import com.abccarsportal.ABCCarsPortal.service.AdminService;
import com.abccarsportal.ABCCarsPortal.service.CarBiddingService;
import com.abccarsportal.ABCCarsPortal.service.CarService;
import com.abccarsportal.ABCCarsPortal.service.UserService;

@Controller
public class ManagementController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private CarService carService;

	@Autowired
	private CarBiddingService carBiddingService;

	@GetMapping("/usermanagement")
	public String getManagementPage(Model model) {
		List<User> users = userService.getAllUsers();

		model.addAttribute("users", users);

		return "usermanagement";
	}

	@GetMapping("/carmanagement")
	public String getCarManagementPage(Model model) {
		List<Car> userCars = carService.getAllCarsWithUsers();

		// Filter out user cars with approved bids
		List<Car> filteredUserCars = userCars.stream().filter(car -> {
			boolean hasApprovedBid = car.getCarBidding().stream()
					.anyMatch(bid -> "APPROVED".equals(bid.getBidStatus()));
			return !hasApprovedBid;
		}).collect(Collectors.toList());

		List<CarBidding> biddings = carBiddingService.getAllBiddings();
		List<CarTestDrive> testDrives = carService.getAllTestDrives();

		model.addAttribute("testDrives", testDrives);
		model.addAttribute("userCars", filteredUserCars);
		model.addAttribute("biddings", biddings);

		return "carmanagement";
	}

	@PostMapping("/toggleadminStatus")
	public String toggleStatus(@RequestParam("carId") Long carId) {
		try {
			carService.toggleStatus(carId);
			return "redirect:/carmanagement"; 
		} catch (Exception e) {
			e.printStackTrace();
			// Handle error
			return "redirect:/carmanagement"; 
		}
	}

	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") User updatedUser) {
		userService.updateUser(updatedUser);
		return "redirect:/usermanagement";
	}

	@PostMapping("/markAsAdmin")
	public String markAsAdmin(@RequestParam("userId") long userId) {
		adminService.markAsAdmin(userId);
		return "redirect:/usermanagement";
	}

	@PostMapping("/approveBid")
	public String approveBid(@RequestParam("bidId") long bidId) {
		try {
			carBiddingService.approveBid(bidId);
			return "redirect:/carmanagement";
		} catch (BidNotFoundException e) {
			return "redirect:/carmanagement";
		}
	}

	@PostMapping("/denyBid")
	public String denyBid(@RequestParam("bidId") long bidId) {
		try {
			carBiddingService.denyBid(bidId);
			return "redirect:/carmanagement";
		} catch (BidNotFoundException e) {
			return "redirect:/carmanagement";
		}
	}
	
	@PostMapping("/approveTestDrive")
    public String approveTestDrive(@RequestParam("testDriveId") long testDriveId) {
        try {
            carService.approveTestDrive(testDriveId);
            return "redirect:/carmanagement";
        } catch (TestDriveNotFoundException e) {
            // Handle the exception, for example, show an error message
            return "redirect:/carmanagement?error=testDriveNotFound";
        }
    }
	
	@PostMapping("/denyTestDrive")
	public String denyTestDrive(@RequestParam("testDriveId") long testDriveId) {
	    try {
	        carService.denyTestDrive(testDriveId);
	        return "redirect:/carmanagement";
	    } catch (TestDriveNotFoundException e) {
	        // Handle the exception, for example, show an error message
	        return "redirect:/carmanagement?error=testDriveNotFound";
	    }
	}
}
