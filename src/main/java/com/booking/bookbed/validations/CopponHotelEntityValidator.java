package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.modelviews.CopponHotelEntity;


import org.springframework.stereotype.Component;

@Component("copponHotelEntityValidator")
public class CopponHotelEntityValidator implements Validator {
 	@Override
	public boolean supports(Class<?> clazz) {
		
		return CopponHotelEntity.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        CopponHotelEntity copponHotelEntity = (CopponHotelEntity)target;
        if(copponHotelEntity.getDiscountName().equals("")){
            errors.rejectValue("discountName", "required");
        }else if(copponHotelEntity.getDiscountName().length() >250){
            errors.rejectValue("discountName", "length");
        }
        try {
            double sale = Double.valueOf(copponHotelEntity.getDiscountValue());
            if (copponHotelEntity.getDiscountValue().equals("")) {
                errors.rejectValue("discountValue", "required");
            }else
            if(sale <=0 || sale > 100){
                errors.rejectValue("discountValue", "percent");
            }
           
        } catch (Exception e) {
            errors.rejectValue("discountValue", "percent");
        }
      

		
	}


}