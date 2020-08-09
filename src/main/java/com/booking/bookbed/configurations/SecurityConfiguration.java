package com.booking.bookbed.configurations;
import com.booking.bookbed.services.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter;
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
	private AccountService accountService;
    	// chan link super admin, admin va employee
	@Override
	protected void configure(final HttpSecurity http) throws Exception {

		http.cors().and().csrf().disable();

        http.authorizeRequests().antMatchers("/booking/**").access("hasRole('ROLE_SUPER_USER') or hasRole('ROLE_USER')")
				.antMatchers("/user/account/**")
				.access("hasRole('ROLE_SUPER_USER')or hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE') or hasRole('ROLE_SUPER_ADMIN') or hasRole('ROLE_USER')")
				.and().formLogin().loginPage("/account/login").loginProcessingUrl("/login/process")
				.defaultSuccessUrl("/home/index").failureUrl("/account/login?error").usernameParameter("username")	
				.passwordParameter("password").and().logout().deleteCookies("JSESSIONID").and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400)
				.and().logout().logoutUrl("/account/logout").logoutSuccessUrl("/account/login?logout").and().exceptionHandling().accessDeniedPage("/home/index");

	}

	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(accountService);
	}

	// ma hoa bcrypt
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityContextHolderAwareRequestFilter awareRequestFilter() {
		return new SecurityContextHolderAwareRequestFilter();
	}

	@Bean
	public SecurityContextPersistenceFilter persistenceFilter() {
		return new SecurityContextPersistenceFilter();
	}
}