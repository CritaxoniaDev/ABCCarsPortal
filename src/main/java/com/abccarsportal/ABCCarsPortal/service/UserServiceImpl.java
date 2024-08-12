package com.abccarsportal.ABCCarsPortal.service;

import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.abccarsportal.ABCCarsPortal.dao.ProfilePicture;
import com.abccarsportal.ABCCarsPortal.dao.Role;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.repository.ProfilePictureRepository;
import com.abccarsportal.ABCCarsPortal.repository.RoleRepository;
import com.abccarsportal.ABCCarsPortal.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private ProfilePictureRepository pictureRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public void registerUser(String name, String userName, String email, String phoneNumber, String password,
			Date registrationDate) {
		if (emailExists(email)) {
			throw new RuntimeException("Email already exists");
		}

		// Create a new user
		User user = new User();
		user.setName(name);
		user.setUserName(userName);
		user.setEmail(email);
		user.setPhoneNumber(phoneNumber);
		user.setPassword(passwordEncoder.encode(password));
		user.setRegistrationDate(registrationDate);

		// Set the user role
		Role userRole = roleRepository.findByRoleName("USER");
		if (userRole == null) {
			throw new RuntimeException("Role 'USER' not found.");
		}
		user.setRoles(Collections.singleton(userRole));

		// Save the user
		userRepository.save(user);
	}

	@Override
	public boolean emailExists(String email) {
		// TODO Auto-generated method stub
		return userRepository.existsByEmail(email);
	}

	@Override
	public void setPasswordEncoder(PasswordEncoder passwordEncoder) {

	}

	@Override
	public User findByUserName(String userName) {
		return userRepository.findByUserName(userName);
	}

	@Override
	public void updateUser(User updatedUser) {
		// Fetch the existing user from the database
		Optional<User> optionalUser = userRepository.findById(updatedUser.getId());

		if (optionalUser.isPresent()) {
			User existingUser = optionalUser.get();

			// Update the existing user's details
			existingUser.setName(updatedUser.getName());
			existingUser.setUserName(updatedUser.getUserName());
			existingUser.setPhoneNumber(updatedUser.getPhoneNumber());

			// Save the updated user
			userRepository.save(existingUser);
		} else {
			throw new RuntimeException("User not found");
		}
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

    @Override
    public void saveImage(MultipartFile file, User profile) throws Exception {
        try {
            byte[] imageData = file.getBytes();
            String encodedImageData = Base64.getEncoder().encodeToString(imageData);

            if (profile.getProfilePicture() == null) {
                // Set Profile Picture if no profile picture
                ProfilePicture picture = new ProfilePicture();

                picture.setFileName(file.getOriginalFilename());
                picture.setFileType(file.getContentType());
                picture.setImage(encodedImageData); // Store image data as base64-encoded string
                picture.setUser(profile);

                pictureRepository.save(picture);
            } else {
                // Edit Profile Picture if profile picture exists
                ProfilePicture picture = profile.getProfilePicture();

                picture.setFileName(file.getOriginalFilename());
                picture.setFileType(file.getContentType());
                picture.setImage(encodedImageData); // Store image data as base64-encoded string
                picture.setUser(profile);

                pictureRepository.save(picture);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
