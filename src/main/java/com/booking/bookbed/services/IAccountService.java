package com.booking.bookbed.services;

import java.util.List;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.UserGroup;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface IAccountService extends UserDetailsService  {
	public Account findById(int id);

	public Iterable<Account> findAll();

	public Account find(int id);

	public Account save(Account account);

	public Long statisticalUser(Integer id, int month, int year);

	public List<Account> findAllEmployee(Integer id);

	public List<Account> findAllAdminEmployee(Integer idEmployee, Integer idAdmin);

	public List<Long> statisticalUsers(Integer id);

//public List<UserGroup> statisticalUserses(Integer id);
	public List<UserGroup> statisticalUserses(Integer id);

	public Account findByUsernameAndStatus(String username, boolean status);
	
	public Account findByUsername(String username);
	public Account findByEmail(String email);
}
