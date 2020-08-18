package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.booking.bookbed.modelviews.PasswordRecovery;

import org.springframework.stereotype.Component;

@Component("passwordRecoveryValidator")
public class PasswordRecoveryValidator implements Validator{

    private String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";

	@Override
	public boolean supports(Class<?> clazz) {
		
		return PasswordRecovery.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
      
        PasswordRecovery passwordRecovery = (PasswordRecovery)target;
   
        if(!passwordRecovery.getNewPassword().matches(pattern) || passwordRecovery.getNewPassword().equals("")){
            errors.rejectValue("newPassword", "matches");
        }
        
        else if(!passwordRecovery.getNewPassword().equals(passwordRecovery.getRePassword())){
            errors.rejectValue("rePassword", "incorrect");
       
	}
    }



}