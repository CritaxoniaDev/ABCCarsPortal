package com.abccarsportal.ABCCarsPortal.service;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.CarBidding;
import com.abccarsportal.ABCCarsPortal.dao.CarPicture;
import com.abccarsportal.ABCCarsPortal.dao.CarTestDrive;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.dto.TestDriveStatus;
import com.abccarsportal.ABCCarsPortal.exceptions.TestDriveNotFoundException;
import com.abccarsportal.ABCCarsPortal.repository.CarBiddingRepository;
import com.abccarsportal.ABCCarsPortal.repository.CarPictureRepository;
import com.abccarsportal.ABCCarsPortal.repository.CarRepository;
import com.abccarsportal.ABCCarsPortal.repository.CarTestDriveRepository;
import com.abccarsportal.ABCCarsPortal.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CarServiceImpl implements CarService {

    @Autowired
    private CarRepository carRepository;
    
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CarPictureRepository carPictureRepository;
    
    @Autowired
    private CarBiddingRepository carBiddingRepository;
    
    @Autowired
    private CarTestDriveRepository carTestDriveRepository;

	
	@Override
	public void saveCar(Car car) {
		car.setStatus("ACTIVE");
		carRepository.save(car);
	}

	@Override
	public void saveCarPicture(MultipartFile file, Car car) throws Exception {
	    try {
	        byte[] imageData = file.getBytes();
	        String encodedImageData = Base64.getEncoder().encodeToString(imageData);

	        CarPicture carPicture = car.getCarPicture();
	        if (carPicture == null) {
	            carPicture = new CarPicture();
	        }

	        carPicture.setFileName(file.getOriginalFilename());
	        carPicture.setFileType(file.getContentType());
	        carPicture.setImage(encodedImageData); // Store image data as base64-encoded string
	        carPicture.setCar(car);

	        carPictureRepository.save(carPicture);
	    } catch (Exception e) {
	        throw new Exception("Failed to save car picture: " + e.getMessage());
	    }
	}

	@Override
	public List<Car> getAllCars() {
		return carRepository.findAll();
	}
	
	@Override
	public List<Car> searchCars(String keyword) {
	    // Trim leading and trailing whitespace
	    keyword = keyword.trim();

	    // Check if the keyword is empty or contains only whitespace
	    if (keyword.isEmpty()) {
	        return Collections.emptyList(); // Return an empty list
	    }

	    // Split the keyword into individual words
	    String[] keywords = keyword.toLowerCase().split("\\s+");
	    List<Car> searchResults = new ArrayList<>();

	    for (String kw : keywords) {
	        List<Car> partialResults = carRepository.searchCars("%" + kw + "%");
	        searchResults.addAll(partialResults);
	    }

	    // Remove duplicate cars from the search results
	    searchResults = searchResults.stream().distinct().collect(Collectors.toList());

	    return searchResults;
	}
	
	@Override
	public Car getCarById(Long id) {
	    return carRepository.findById(id).orElse(null);
	}
	
    @Override
    public void toggleStatus(Long carId) {
        Car car = carRepository.findById(carId).orElse(null);
        if (car != null) {
            if ("ACTIVE".equals(car.getStatus())) {
                car.setStatus("INACTIVE");
            } else {
                car.setStatus("ACTIVE");
            }
            carRepository.save(car);
        }
    }
    
	@Override
	public boolean deactivateCar(Long carId) {
	    Car car = carRepository.findById(carId).orElse(null);
	    if (car != null && "ACTIVE".equals(car.getStatus())) {
	        car.setStatus("INACTIVE");
	        carRepository.save(car);
	        return true; // Car successfully deactivated
	    }
	    return false; // Car not found or already inactive
	}
    
    @Override
    public List<Car> getPostedCarsByUser(User user) {
        return carRepository.findByUser(user);
    }
    
    @Override
    public List<Car> getAllCarsWithUsers() {
        return carRepository.findAllWithUsers();
    }
    
    @Override
    public List<Car> getCarsByBidStatus(String bidStatus) {
        List<CarBidding> carBiddings = carBiddingRepository.findByBidStatus(bidStatus);
        List<Car> cars = carBiddings.stream().map(CarBidding::getCar).collect(Collectors.toList());
        return cars;
        
    }
    
    @Override
    public boolean userHasDeniedOrEmptyBidStatusCars(User user) {
        List<Car> userCars = carRepository.findByUser(user);
        
        for (Car car : userCars) {
            List<CarBidding> carBiddings = car.getCarBidding();
            for (CarBidding bidding : carBiddings) {
                String currentBidStatus = bidding.getBidStatus();
                if (currentBidStatus == null || currentBidStatus.equals("DENIED")) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    @Override
    public boolean hasPostedCars(User user) {
        return !carRepository.findByUser(user).isEmpty();
    }
    
    @Override
    public void scheduleTestDrive(Long userId, Long carId, String testDriveDate) throws Exception {
        try {
            // Retrieve user and car objects from their IDs
            User user = userRepository.findById(userId).orElse(null);
            Car car = carRepository.findById(carId).orElse(null);

            if (user == null || car == null) {
                throw new Exception("User or Car not found.");
            }

            // Create and save the test drive object
            CarTestDrive testDrive = new CarTestDrive();
            testDrive.setDate(testDriveDate);
            testDrive.setUser(user);
            testDrive.setCar(car);
            carTestDriveRepository.save(testDrive);
        } catch (Exception e) {
            throw new Exception("Failed to schedule test drive: " + e.getMessage());
        }
    }

    @Override
    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }
    
    @Override
    public List<CarTestDrive> getAllTestDrives() {
        return carTestDriveRepository.findAll();
    }
    
    @Override
    public void approveTestDrive(long testDriveId) {
        CarTestDrive testDrive = carTestDriveRepository.findById(testDriveId)
                .orElseThrow(TestDriveNotFoundException::new);
        testDrive.setTestDriveStatus(TestDriveStatus.APPROVED);
        carTestDriveRepository.save(testDrive);
    }
    
    @Override
    public void denyTestDrive(long testDriveId) {
        CarTestDrive testDrive = carTestDriveRepository.findById(testDriveId)
                .orElseThrow(TestDriveNotFoundException::new);
        testDrive.setTestDriveStatus(TestDriveStatus.DENIED);
        carTestDriveRepository.save(testDrive);
    }

    @Override
    public CarTestDrive getTestDriveById(Long testDriveId) {
        return carTestDriveRepository.findById(testDriveId).orElseThrow(TestDriveNotFoundException::new);
    }

    @Override
    public boolean hasApprovedTestDrive(String make, String model) {
        List<CarTestDrive> approvedTestDrives = carTestDriveRepository.findByCarMakeAndCarModelAndTestDriveStatus(
                make, model, TestDriveStatus.APPROVED);
        return !approvedTestDrives.isEmpty();
    }
 
}

