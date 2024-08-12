package com.abccarsportal.ABCCarsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.CarBidding;

@Repository
public interface CarBiddingRepository extends JpaRepository<CarBidding, Long> {

	List<CarBidding> findByCarCarId(Long carId);
	
	List<CarBidding> findByBidStatus(String bidStatus);

}
