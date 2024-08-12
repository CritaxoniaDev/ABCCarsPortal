package com.abccarsportal.ABCCarsPortal.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.CarBidding;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.exceptions.BidNotFoundException;
import com.abccarsportal.ABCCarsPortal.repository.CarBiddingRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CarBiddingServiceImpl implements CarBiddingService {

	@Autowired
	private CarBiddingRepository carBiddingRepository;
	
	@Autowired
    private CarService carService;

	@Override
	public List<CarBidding> getallBiddings(Long carId) {
		return carBiddingRepository.findByCarCarId(carId);
	}

	@Override
	public void placeBid(Long carId, String bidName, int bidPrice, User user) {
		CarBidding carBidding = new CarBidding();
		carBidding.setBidName(bidName);
		carBidding.setBidPrice(bidPrice);
		carBidding.setBidDate(new Date());
		carBidding.setUser(user);

		Car car = carService.getCarById(carId);
		carBidding.setCar(car);
		carBiddingRepository.save(carBidding);
	}
	
	@Override
    public List<CarBidding> getAllBiddings() {
        return carBiddingRepository.findAll();
    }


    @Override
    public void approveBid(Long bidId) {
        Optional<CarBidding> optionalBid = carBiddingRepository.findById(bidId);
        if (optionalBid.isPresent()) {
            CarBidding bid = optionalBid.get();
            bid.setBidStatus("APPROVED");
            carBiddingRepository.save(bid);
        } else {
            throw new BidNotFoundException("Bid with ID " + bidId + " not found");
        }
    }

    @Override
    public void denyBid(Long bidId) throws BidNotFoundException {
        Optional<CarBidding> optionalBid = carBiddingRepository.findById(bidId);
        if (optionalBid.isPresent()) {
            CarBidding bid = optionalBid.get();
            bid.setBidStatus("DENIED");
            carBiddingRepository.save(bid);
        } else {
            throw new BidNotFoundException("Bid with ID " + bidId + " not found");
        }
    }
}
