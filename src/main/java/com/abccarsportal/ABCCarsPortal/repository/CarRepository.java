package com.abccarsportal.ABCCarsPortal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.Car;
import com.abccarsportal.ABCCarsPortal.dao.User;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {

	List<Car> findByUserId(Long userId);

	@Query("SELECT c FROM Car c WHERE LOWER(c.make) LIKE %:keyword% OR "
	        + "LOWER(c.model) LIKE %:keyword% OR "
	        + "LOWER(c.year) LIKE %:keyword% OR "
	        + "CAST(c.price AS string) LIKE %:keyword%")
	List<Car> searchCars(@Param("keyword") String keyword);

	List<Car> findByUser(User user);

	@Query("SELECT c FROM Car c JOIN FETCH c.user")
	List<Car> findAllWithUsers();

}
