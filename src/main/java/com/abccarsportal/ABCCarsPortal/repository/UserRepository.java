package com.abccarsportal.ABCCarsPortal.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	boolean existsByEmail(String email);

	User findByUserName(String userName);
	
	Optional<User> findById(long id);

}
