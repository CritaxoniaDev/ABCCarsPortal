package com.abccarsportal.ABCCarsPortal.controller;

import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.CarBidding;
import com.abccarsportal.ABCCarsPortal.dao.CarTestDrive;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.repository.UserRepository;
import com.abccarsportal.ABCCarsPortal.service.CarBiddingService;
import com.abccarsportal.ABCCarsPortal.service.CarService;
import com.abccarsportal.ABCCarsPortal.service.UserService;

@Controller
public class CarController {

	@Autowired
	private UserService userService;

	@Autowired
	private CarService carService;

	@Autowired
	private CarBiddingService carBiddingService;

	@Autowired
	private UserRepository userRepository;

	@GetMapping("/carupload")
	public String getCarUploadPage() {
		return "carupload";
	}

	@GetMapping("/mycarsconfirmation")
	public String getMyCarsConfirmationPage() {
		return "mycarsconfirmation";
	}

	@GetMapping("/car")
	public String getCarPage() {
		return "car";
	}

	@PostMapping("/uploadCar")
	public String uploadCar(@RequestParam("make") String make, @RequestParam("model") String model,
			@RequestParam("year") String year, @RequestParam("price") Integer price,
			@RequestParam("file") MultipartFile file) {
		try {

			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String username = authentication.getName();

			User user = userRepository.findByUserName(username);

			// Create a new Car object
			Car car = new Car();
			car.setMake(make);
			car.setModel(model);
			car.setYear(year);
			car.setPrice(price);
			car.setStatus("ACTIVE");

			// Set the user ID
			car.setUser(user);

			// Save the car details
			carService.saveCar(car);

			// Handle the car picture upload using existing service method
			carService.saveCarPicture(file, car);

			return "redirect:/mycarsconfirmation";
		} catch (Exception e) {
			e.printStackTrace();

			return "redirect:/carupload";
		}
	}

	@GetMapping("/mycars")
	public String getMyCars(Model model, Principal principal) {
		// Get the currently authenticated user's username
		String username = principal.getName();

		// Retrieve user details from your user repository
		User user = userRepository.findByUserName(username);

		// Retrieve the list of cars uploaded by the current user from the database
		List<Car> cars = carService.getPostedCarsByUser(user);

		// Iterate over cars to check if any car has an approved bidding
		for (Car car : cars) {
			boolean hasApprovedBid = car.getCarBidding().stream()
					.anyMatch(bid -> "APPROVED".equals(bid.getBidStatus()));
			car.setHasApprovedBid(hasApprovedBid);
		}

		// Add the list of cars to the model
		model.addAttribute("cars", cars);

		return "mycars";
	}

	@GetMapping("/search")
	public String searchCars(@RequestParam("keyword") String keyword, Model model) {

		List<Car> searchResults = carService.searchCars(keyword);

		List<Car> activeSearchResults = searchResults.stream().filter(car -> "ACTIVE".equals(car.getStatus()))
				.collect(Collectors.toList());

		boolean noActiveCarsFound = activeSearchResults.isEmpty() || activeSearchResults.stream().allMatch(
				car -> car.getCarBidding().stream().anyMatch(bidding -> "APPROVED".equals(bidding.getBidStatus())));

		model.addAttribute("activeSearchResults", activeSearchResults);
		model.addAttribute("noActiveCarsFound", noActiveCarsFound);

		System.out.println("noActiveCarsFound: " + noActiveCarsFound);

		return "searchresults";
	}

	@GetMapping("/updatecar")
	public String getUpdateCarPage(Model model, @RequestParam("carId") Long carId) {
		Car car = carService.getCarById(carId);
		model.addAttribute("car", car);
		return "updatecar";
	}

	@PostMapping("/updateCar")
	public String updateCar(@RequestParam("carId") Long carId, @RequestParam("make") String make,
			@RequestParam("model") String model, @RequestParam("year") String year,
			 @RequestParam("file") MultipartFile file) {
		try {
			// Get the car from the database
			Car car = carService.getCarById(carId);
			if (car != null) {
				// Update car details
				car.setMake(make);
				car.setModel(model);
				car.setYear(year);

				// Update car picture if provided
				if (!file.isEmpty()) {
					carService.saveCarPicture(file, car);
				}

				// Save the updated car
				carService.saveCar(car);
			}
			return "redirect:/mycars";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/mycars";
		}
	}

	@PostMapping("/toggleStatus")
	public String toggleStatus(@RequestParam("carId") Long carId, RedirectAttributes redirectAttributes) {
	    try {
	        boolean isDeactivated = carService.deactivateCar(carId);

	        if (isDeactivated) {
	            redirectAttributes.addFlashAttribute("infoMessage", "Car deactivated. Please wait for admin approval.");
	        } else {
	            redirectAttributes.addFlashAttribute("infoMessage", "Car is already deactivated or not found.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Handle error
	    }
	    return "redirect:/mycars";
	}

	@GetMapping("/carbidding")
	public String getCarBiddingPage(@RequestParam("carId") Long carId, Model model) {
		Car car = carService.getCarById(carId);
		List<CarBidding> bids = carBiddingService.getallBiddings(carId);
		model.addAttribute("car", car);
		model.addAttribute("bids", bids);
		return "carbidding";
	}

	@PostMapping("/placeBid")
	public String placeBid(@RequestParam("carId") Long carId, @RequestParam("bidName") String bidName,
	        @RequestParam("bidPrice") int bidPrice, Principal principal, RedirectAttributes redirectAttributes) {
	    try {
	        String username = principal.getName();

	        User user = userRepository.findByUserName(username);

	        // Retrieve the car details
	        Car car = carService.getCarById(carId);
	        if (car == null) {
	            redirectAttributes.addFlashAttribute("errorMessage", "Car not found.");
	            return "redirect:/carbidding?carId=" + carId;
	        }

	        if (bidPrice <= car.getPrice()) {
	            redirectAttributes.addFlashAttribute("errorMessage", "Bid price must be higher than the actual price of the car.");
	            return "redirect:/carbidding?carId=" + carId;
	        }

	        // Place the bid
	        carBiddingService.placeBid(carId, bidName, bidPrice, user);

	        return "redirect:/carbidding?carId=" + carId;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Handle error
	        return "redirect:/carbidding?carId=" + carId;
	    }
	}

	@GetMapping("/approvecars")
	public String getApproveCarsPage(Model model, Principal principal) {
		String username = principal.getName();
		User user = userService.findByUserName(username);
		if (user != null) {
			Long loggedInUserId = user.getId();
			model.addAttribute("loggedInUserId", loggedInUserId);
			boolean userHasDeniedOrEmptyStatusCars = carService.userHasDeniedOrEmptyBidStatusCars(user);
			model.addAttribute("userHasDeniedOrEmptyStatusCars", userHasDeniedOrEmptyStatusCars);

			// Check if the user has posted any cars
			boolean userHasPostedCars = carService.hasPostedCars(user);
			model.addAttribute("userHasPostedCars", userHasPostedCars);
		} else {
			return "error";
		}
		List<Car> approvedCars = carService.getCarsByBidStatus("APPROVED");
		model.addAttribute("approvedCars", approvedCars);
		return "approvecars";
	}
	
    @GetMapping("/testdrive")
    public String getTestDrivePage(@RequestParam("carId") Long carId, Model model, Principal principal) {
        String username = principal.getName();

        User user = userRepository.findByUserName(username);
        if (user != null) {
            Long userId = user.getId();
            model.addAttribute("userId", userId);
        } else {
            return "error";
        }
        
        // Retrieve car information by carId
        Car car = carService.getCarById(carId);

        // Add car make and model to the model
        model.addAttribute("carMake", car.getMake());
        model.addAttribute("carModel", car.getModel());
        model.addAttribute("carImage", car.getCarPicture().getImage());
        model.addAttribute("imageFileType", car.getCarPicture().getFileType());
        model.addAttribute("carId", carId);

        return "testdrive";
    }

    @PostMapping("/scheduleTestDrive")
    public String scheduleTestDrive(@RequestParam("testDriveDate") String testDriveDate,
                                    @RequestParam("carId") Long carId,
                                    @RequestParam("userId") Long userId,
                                    RedirectAttributes redirectAttributes) {
        try {
            // Check if a test drive has already been scheduled for the given car and user
            List<CarTestDrive> testDrives = carService.getAllTestDrives();
            boolean testDriveAlreadyScheduled = testDrives.stream()
                    .anyMatch(testDrive -> testDrive.getCar().getCarId() == carId && 
                                           testDrive.getUser().getId() == userId);

            if (testDriveAlreadyScheduled) {
                // If a test drive is already scheduled, display a success alert
                redirectAttributes.addFlashAttribute("successMessage", "Test drive already scheduled. Please wait for admin approval.");
            } else {
                // If no test drive is scheduled, proceed with scheduling
                carService.scheduleTestDrive(userId, carId, testDriveDate);
                redirectAttributes.addFlashAttribute("successMessage", "Test drive scheduled. Please wait for admin approval.");
            }
            return "redirect:/testdrive?carId=" + carId; // Include the carId parameter in the redirect
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error
            return "redirect:/testdrive?carId=" + carId; // Include the carId parameter in case of error
        }
    }

}
