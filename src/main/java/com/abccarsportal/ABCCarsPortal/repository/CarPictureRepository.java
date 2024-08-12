package com.abccarsportal.ABCCarsPortal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.CarPicture;

@Repository
public interface CarPictureRepository extends JpaRepository<CarPicture, Long> {

}
