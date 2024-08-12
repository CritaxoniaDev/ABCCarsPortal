package com.abccarsportal.ABCCarsPortal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abccarsportal.ABCCarsPortal.dao.Role;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.repository.RoleRepository;
import com.abccarsportal.ABCCarsPortal.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Override
	public void markAsAdmin(long userId) {
		User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
		Role adminRole = roleRepository.findByRoleName("ADMIN");
		user.getRoles().add(adminRole);
		userRepository.save(user);
	}

}
