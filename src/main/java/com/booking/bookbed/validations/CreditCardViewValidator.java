package com.booking.bookbed.validations;

import com.booking.bookbed.modelviews.CreditCardView;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("creditCardValidator")
public class CreditCardViewValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
       
        return CreditCardView.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
       CreditCardView creditCardView = (CreditCardView)target;
    
    if (creditCardView.getCardNumber().length() <13 || creditCardView.getCardNumber().length() >17) {
        errors.rejectValue("cardNumber", "length");
    }
    if (!creditCardView.getExpireOn().matches("(0[1-9]|10|11|12)/20[0-9]{2}$")) {
        errors.rejectValue("expireOn", "matches");
    }


    

    }
    
}