package com.abccarsportal.ABCCarsPortal.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.abccarsportal.ABCCarsPortal.dao.CarBidding;
import com.abccarsportal.ABCCarsPortal.dao.User;

@Service
public interface CarBiddingService {
	
	List<CarBidding> getallBiddings(Long carId);
	
	List<CarBidding> getAllBiddings();
	
	void placeBid(Long carId, String bidName, int bidPrice, User user);

    void approveBid(Long bidId);
    
    void denyBid(Long bidId);
	
}
