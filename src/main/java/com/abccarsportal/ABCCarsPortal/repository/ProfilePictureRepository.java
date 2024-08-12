package com.abccarsportal.ABCCarsPortal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.ProfilePicture;

@Repository
public interface ProfilePictureRepository extends JpaRepository<ProfilePicture, Long> {

}
