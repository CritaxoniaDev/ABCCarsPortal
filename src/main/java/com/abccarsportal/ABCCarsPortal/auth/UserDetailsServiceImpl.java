package com.abccarsportal.ABCCarsPortal.auth;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.abccarsportal.ABCCarsPortal.dao.Role;
import com.abccarsportal.ABCCarsPortal.dao.User;
import com.abccarsportal.ABCCarsPortal.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("Username Logged in is: " + username);

        User user = userRepository.findByUserName(username);

        if (user == null) {
            throw new UsernameNotFoundException("User " + username + " not found");
        }

        String[] roleNames = user.getRoles().stream().map(Role::getRoleName).toArray(String[]::new);

        System.out.println("Role Names: " + Arrays.toString(roleNames));

        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getUserName())
                .password(user.getPassword()) 
                .roles(roleNames)
                .build();
    }	
}
