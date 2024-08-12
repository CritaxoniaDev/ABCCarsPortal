package com.abccarsportal.ABCCarsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.CarTestDrive;
import com.abccarsportal.ABCCarsPortal.dto.TestDriveStatus;

@Repository
public interface CarTestDriveRepository extends JpaRepository<CarTestDrive, Long> {

	List<CarTestDrive> findByCarMakeAndCarModelAndTestDriveStatus(String make, String model, TestDriveStatus status);

}
