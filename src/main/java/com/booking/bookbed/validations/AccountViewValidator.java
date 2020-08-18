package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.modelviews.AccountView;

import org.springframework.stereotype.Component;

@Component("accountViewValidator")
public class AccountViewValidator implements Validator{
    private String regexEmail = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
	@Override
	public boolean supports(Class<?> clazz) {
		
		return AccountView.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        AccountView account = (AccountView)target;
        if(account.getFullname().equals("")){

            errors.rejectValue("fullname", "required");
        }else if(account.getFullname().length() > 250){
            errors.rejectValue("fullname", "length");

        }
            if (account.getBirthday().equals("") ) {
                errors.rejectValue("birthday", "required");
            }else if(!account.getBirthday().matches("\\d{2}[-|/]\\d{2}[-|/]\\d{4}")){
                errors.rejectValue("birthday", "matches");
            }
            
            // if (account.getEmail() == "" ) {
            //     errors.rejectValue("email", "account.email.required");
            // }else if(!account.getEmail().matches(regexEmail)){
            //     errors.rejectValue("email", "account.email.matches");
            // }
            if(account.getAddress().equals("")){

                errors.rejectValue("address", "required");
            }else if(account.getAddress().length() > 500){
                errors.rejectValue("address", "length");
    
            }
            if (account.getGender().equalsIgnoreCase("male") && account.getGender().equalsIgnoreCase("female")) {
                errors.rejectValue("gender", "matches");
            }
            if(account.getIdentityCard().equals("")){
                errors.rejectValue("identityCard", "required");
            }else if(account.getIdentityCard().length() > 25){
                errors.rejectValue("identityCard", "length");
    
            }
       

		
	}


}