package com.abccarsportal.ABCCarsPortal.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abccarsportal.ABCCarsPortal.dao.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
	
	@Query("SELECT r FROM Role r WHERE r.roleName IN :role")
    Set<Role> findBySpecificRoles(@Param("role") Set<String> roles);
	
	Role findByRoleName(String roleName);

}
