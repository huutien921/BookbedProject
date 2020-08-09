package com.booking.bookbed.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.RoleAccount;
import com.booking.bookbed.repositories.RoleAccountRepository;

@Service("roleAccountService")
public class RoleAccountService implements IRoleAccountService {
@Autowired
private RoleAccountRepository roleAccountRepository;

@Override
public RoleAccount save(RoleAccount roleAccount) {
	
	return roleAccountRepository.save(roleAccount);
}
}
