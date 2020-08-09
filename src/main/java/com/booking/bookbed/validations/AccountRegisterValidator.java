package com.booking.bookbed.validations;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.modelviews.AccountRegister;
import com.booking.bookbed.services.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("accountRegisterValidator")
public class AccountRegisterValidator implements Validator{
    @Autowired 
    private AccountService  accountService;
    private String regexUsername ="^[a-zA-Z0-9._-]{3,32}$";
    private String regexEmail = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
    private String regexPassword = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";

    	@Override
	public boolean supports(Class<?> clazz) {
		
		return AccountRegister.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        AccountRegister account = (AccountRegister)target;
        if(accountService.findByUsername(account.getUsername()) !=null){
            errors.rejectValue("username", "exist");
        }
        if(account.getUsername() == "" || account.getUsername() == null){

            errors.rejectValue("username", "required");
        }else if(!account.getUsername().matches(regexUsername)){
            errors.rejectValue("username", "matches");
        }
        if (!account.getEmail().matches(regexEmail) || account.getEmail().equals(null)) {
            errors.rejectValue("email", "matches");
        }else if(accountService.findByUsername(account.getUsername()) !=null){
            errors.rejectValue("email", "exist");
        }

        if (!account.getPassword().matches(regexPassword)) {
            errors.rejectValue("password", "matches");
        } else if(!account.getPassword().equals(account.getRePassword())){
            errors.rejectValue("rePassword", "incorrect");
            

		
	}
    }

}