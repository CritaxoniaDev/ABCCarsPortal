package com.abccarsportal.ABCCarsPortal.dao;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "car")
public class Car {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "car_id")
	private Long carId;

	@NotNull
	private String make;

	@NotNull
	private String model;

	@NotNull
	private String year;

	@NotNull
	private String status;
	
	@Column(name = "car_price")
	@Digits(integer = 10, fraction = 2)
	@NotNull
	private Integer price;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	private User user;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "car")
	private CarPicture carPicture;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "car")
	private List<CarBidding> carBidding;
	
	@Transient
    private boolean hasApprovedBid;

	public Car(Long carId, @NotNull String make, @NotNull String model, @NotNull String year, @NotNull String status,
			@Digits(integer = 10, fraction = 2) @NotNull Integer price, User user, CarPicture carPicture,
			List<CarBidding> carBidding) {
		this.carId = carId;
		this.make = make;
		this.model = model;
		this.year = year;
		this.status = status;
		this.price = price;
		this.user = user;
		this.carPicture = carPicture;
		this.carBidding = carBidding;
	}

	public Car() {

	}

	public Long getCarId() {
		return carId;
	}

	public void setCarId(Long carId) {
		this.carId = carId;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public CarPicture getCarPicture() {
		return carPicture;
	}

	public void setCarPicture(CarPicture carPicture) {
		this.carPicture = carPicture;
	}

	public List<CarBidding> getCarBidding() {
		return carBidding;
	}

	public void setCarBidding(List<CarBidding> carBidding) {
		this.carBidding = carBidding;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean getHasApprovedBid() {
		return hasApprovedBid;
	}

	public void setHasApprovedBid(boolean hasApprovedBid) {
		this.hasApprovedBid = hasApprovedBid;
	}

}
