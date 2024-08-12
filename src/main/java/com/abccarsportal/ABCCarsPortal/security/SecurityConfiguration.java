package com.abccarsportal.ABCCarsPortal.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.abccarsportal.ABCCarsPortal.auth.CustomDeniedAccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	AccessDeniedHandler accessDeniedHandler() {
		return new CustomDeniedAccessHandler();
	}

	@SuppressWarnings("deprecation")
	@Bean
	SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {

		httpSecurity.csrf(csrf -> 
				csrf.disable())
		.authorizeRequests(auth -> {
			auth.requestMatchers("/").permitAll();
			auth.requestMatchers("/index").permitAll();
			auth.requestMatchers("/registration").permitAll();
			auth.requestMatchers("/confirmation").permitAll();
			auth.requestMatchers("/login").permitAll();
			auth.requestMatchers("/dashboard").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/mycars").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/mycarsconfirmation").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/updatecar").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/carbidding").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/approvecars").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/testdrive").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/carupload").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/searchresults").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/aboutus").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/contactus").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/userprofile").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/editprofile").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/updateprofilepicture").hasAnyRole("USER", "ADMIN");
			auth.requestMatchers("/usermanagement").hasRole("ADMIN");
			auth.requestMatchers("/carmanagement").hasRole("ADMIN");
		})
		.formLogin(form -> 
				form.loginPage("/login")
				.loginProcessingUrl("/login")
				.failureUrl("/login_error")
				.defaultSuccessUrl("/dashboard").permitAll()
		)
		.logout(logout -> 
				logout.logoutRequestMatcher(new AntPathRequestMatcher("/logout")).permitAll()
		)
		.exceptionHandling(exceptionHandling -> 
				exceptionHandling.accessDeniedHandler(accessDeniedHandler())
		);
		return httpSecurity.build();
	}
}
