package com.abccarsportal.ABCCarsPortal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.CarTestDrive;
import com.abccarsportal.ABCCarsPortal.dao.User;

@Service
public interface CarService {
	
	void saveCar(Car car);
	
	void saveCarPicture(MultipartFile file, Car car) throws Exception;
	
	List<Car> getAllCars();
	
	List<Car> searchCars(String keyword);
	
	Car getCarById(Long id);
	
	void toggleStatus(Long carId);
	
	boolean deactivateCar(Long carId);
	
	List<Car> getPostedCarsByUser(User user);
	
	List<Car> getAllCarsWithUsers();
	
	List<Car> getCarsByBidStatus(String bidStatus);
	
	boolean userHasDeniedOrEmptyBidStatusCars(User user);
	
	boolean hasPostedCars(User user);
	
    void scheduleTestDrive(Long userId, Long carId, String testDriveDate) throws Exception;
    
    User getUserById(Long userId);
    
    List<CarTestDrive> getAllTestDrives();
    
    void approveTestDrive(long testDriveId);
    
    void denyTestDrive(long testDriveId);

    CarTestDrive getTestDriveById(Long testDriveId);

    boolean hasApprovedTestDrive(String make, String model);

}
