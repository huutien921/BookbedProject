package com.booking.bookbed.validations;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.booking.bookbed.modelviews.CopponRoomEntity;

import org.springframework.stereotype.Component;

@Component("CopponRoomEntityValidator")
public class CopponRoomEntityValidator implements Validator {
 	@Override
	public boolean supports(Class<?> clazz) {
		
		return CopponRoomEntity.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
        CopponRoomEntity copponRoomEntity = (CopponRoomEntity)target;
        if(copponRoomEntity.getDiscountName().equals("")){
            errors.rejectValue("discountName", "required");
        }else if(copponRoomEntity.getDiscountName().length() >250){
            errors.rejectValue("discountName", "length");
        }
        try {
            double sale = Double.valueOf(copponRoomEntity.getDiscountValue());
            if (copponRoomEntity.getDiscountValue() == null) {
                errors.rejectValue("discountValue", "required");
            }else
            if(sale <= 0 ||sale >100 ){
                errors.rejectValue("discountValue", "percent");
            }
           
        } catch (Exception e) {
            errors.rejectValue("discountValue", "percent");
        }
      

		
	}


}