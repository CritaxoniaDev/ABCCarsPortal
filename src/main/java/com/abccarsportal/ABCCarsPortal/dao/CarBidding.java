package com.abccarsportal.ABCCarsPortal.dao;

import java.util.Date;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "car_bidding")
public class CarBidding {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_carbid")
	private Long idCarBid;

	@Digits(integer = 10, fraction = 2)
	@Column(name = "bid_price", nullable = false)
	private int bidPrice;

	private String bidStatus;
	
	@NotNull
	private String bidName;
	
	private Date bidDate;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "car_id")
	private Car car;

	public CarBidding(Long idCarBid, @Digits(integer = 10, fraction = 2) int bidPrice, String bidStatus,
			@NotNull String bidName, Date bidDate, User user, Car car) {
		super();
		this.idCarBid = idCarBid;
		this.bidPrice = bidPrice;
		this.bidStatus = bidStatus;
		this.bidName = bidName;
		this.bidDate = bidDate;
		this.user = user;
		this.car = car;
	}

	public CarBidding() {
		
	}

	public Long getIdCarBid() {
		return idCarBid;
	}

	public void setIdCarBid(Long idCarBid) {
		this.idCarBid = idCarBid;
	}

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}

	public String getBidStatus() {
		return bidStatus;
	}

	public void setBidStatus(String bidStatus) {
		this.bidStatus = bidStatus;
	}

	public String getBidName() {
		return bidName;
	}

	public void setBidName(String bidName) {
		this.bidName = bidName;
	}

	public Date getBidDate() {
		return bidDate;
	}

	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

}
