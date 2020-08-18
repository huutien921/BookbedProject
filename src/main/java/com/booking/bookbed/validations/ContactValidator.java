package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.entities.Contact;

import org.springframework.stereotype.Component;

@Component("contactValidator")
public class ContactValidator implements Validator{
    private String regexEmail = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$";
	@Override
	public boolean supports(Class<?> clazz) {
		
		return Contact.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        Contact contact = (Contact)target;
        if(contact.getName().equals("")){

            errors.rejectValue("name", "contact.name.required");
        }else if(contact.getName().length() > 250){
            errors.rejectValue("name", "contact.name.length");

        }
           
            
            if (contact.getEmail().equals("") ) {
                errors.rejectValue("email", "contact.email.required");
            }else if(!contact.getEmail().matches(regexEmail)){
                errors.rejectValue("email", "contact.email.matches");
            }
            if(contact.getTitle().equals("")){
                errors.rejectValue("title", "contact.title.required");
            }else if(contact.getTitle().length() > 250){
                errors.rejectValue("title", "contact.title.length");
            }
            if(contact.getContent().equals("") ){
                errors.rejectValue("content", "contact.content.required");
            }
         
       

		
	}


}