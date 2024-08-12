package com.abccarsportal.ABCCarsPortal.service;

import java.util.Date;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.abccarsportal.ABCCarsPortal.dao.User;

@Service
public interface UserService {
	
	void registerUser(String name, String userName, String email, String phoneNumber, String password, Date registrationDate);
	
	boolean emailExists(String email);

	void setPasswordEncoder(PasswordEncoder passwordEncoder);

	User findByUserName(String userName);

	void updateUser(User updatedUser);

	List<User> getAllUsers();
	
	void saveImage(MultipartFile file, User user) throws Exception;

}
