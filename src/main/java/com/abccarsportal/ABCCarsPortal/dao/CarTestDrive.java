package com.abccarsportal.ABCCarsPortal.dao;

import org.springframework.format.annotation.DateTimeFormat;

import com.abccarsportal.ABCCarsPortal.dto.TestDriveStatus;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "cartest_drive")
public class CarTestDrive {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "testdrive_id")
	private Long testDriveId;

	@DateTimeFormat(pattern = "yyyy/MM/dd")
	@Column(name = "testdrive_date")
	@NotNull
	private String date;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	private User user;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "car_id")
	private Car car;
	
	@Enumerated(EnumType.STRING)
    @Column(name = "testdrive_status")
    private TestDriveStatus testDriveStatus = TestDriveStatus.PENDING;

	public CarTestDrive(Long testDriveId, @NotNull String date, User user, Car car, TestDriveStatus testDriveStatus) {
		this.testDriveId = testDriveId;
		this.date = date;
		this.user = user;
		this.car = car;
		this.testDriveStatus = TestDriveStatus.PENDING;
	}

	public CarTestDrive() {
		this.testDriveStatus = TestDriveStatus.PENDING;
	}

	public Long getTestDriveId() {
		return testDriveId;
	}

	public void setTestDriveId(Long testDriveId) {
		this.testDriveId = testDriveId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public TestDriveStatus getTestDriveStatus() {
		return testDriveStatus;
	}

	public void setTestDriveStatus(TestDriveStatus testDriveStatus) {
		this.testDriveStatus = testDriveStatus;
	}

}
