package com.abccarsportal.ABCCarsPortal.service;

import org.springframework.stereotype.Service;

@Service
public interface AdminService {

	void markAsAdmin(long userId);

}
