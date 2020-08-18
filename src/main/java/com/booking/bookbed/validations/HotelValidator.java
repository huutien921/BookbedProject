package com.booking.bookbed.validations;

import com.booking.bookbed.entities.Hotel;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("hotelValidator")
public class HotelValidator implements Validator {
    @Override
	public boolean supports(Class<?> clazz) {
		
		return Hotel.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        Hotel hotel = (Hotel)target;
        if (hotel.getName().equals("") ) {
            errors.rejectValue("name", "hotel.name.required");
        }else if(hotel.getName().length() > 250){
            errors.rejectValue("name", "hotel.name.length");
        }
        if (hotel.getImage().equals("")) {
            errors.rejectValue("image", "hotel.image.required");
        }
        if (hotel.getAddressFull().equals("") ) {
            errors.rejectValue("addressFull", "hotel.addressFull.required");
        }else if(hotel.getName().length() > 250){
            errors.rejectValue("addressFull", "hotel.addressFull.length");
        }
        if (hotel.getWard().equals("")) {
            errors.rejectValue("ward", "hotel.ward.required");
        }else if(hotel.getWard().length() > 250){
            errors.rejectValue("ward", "hotel.ward.length");
        }
        if (hotel.getCity().equals("") ) {
            errors.rejectValue("city", "hotel.city.required");
        }else if(hotel.getCity().length() > 250){
            errors.rejectValue("city", "hotel.city.length");
        }
        if (hotel.getProvincial().equals("") ) {
            errors.rejectValue("provincial", "hotel.provincial.required");
        }else if(hotel.getProvincial().length() > 250){
            errors.rejectValue("provincial", "hotel.provincial.length");
        }
        if (hotel.getCountry().equals("") ) {
            errors.rejectValue("country", "hotel.country.required");
        }else if(hotel.getCountry().length() > 250){
            errors.rejectValue("country", "hotel.country.length");
        }
        if (hotel.getImage().equals("") ) {
            errors.rejectValue("image", "hotel.image.required");
        }
        
	} 
}