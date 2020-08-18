package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.modelviews.PasswordView;
import com.booking.bookbed.services.AccountService;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("passwordViewValidator")
public class PasswordViewValidator implements Validator{
    private String username = "tien_user";
    @Autowired
    private AccountService accountService;
    private String pattern = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}";

	@Override
	public boolean supports(Class<?> clazz) {
		
		return PasswordView.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        String password  = accountService.findByUsername(username).getPassword();
        PasswordView passwordView = (PasswordView)target;
   
      
        boolean check = BCrypt.checkpw(passwordView.getOldPassword(), password);
        if (!check) {
            errors.rejectValue("oldPassword", "incorrect");
        }else if(!passwordView.getNewPassword().matches(pattern) || passwordView.getNewPassword().equals("")){
            errors.rejectValue("newPassword", "matches");
        }
        
        else if(!passwordView.getNewPassword().equals(passwordView.getRePassword())){
            errors.rejectValue("rePassword", "incorrect");
       
	}
    }



}