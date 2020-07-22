package com.booking.bookbed.services;

import com.booking.bookbed.entities.CreditCard;
import com.booking.bookbed.repositories.CreditCardRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("creditCardService")
public class CreditCardService implements ICreditCardRService {
    @Autowired
private CreditCardRepository creditCardRepository;
    @Override
    public Iterable<CreditCard> findAll() {
        
        return creditCardRepository.findAll();
    }

    @Override
    public CreditCard save(CreditCard creditCard) {
     
        creditCard.setNameCard(creditCard.getNameCard().toUpperCase());
        return creditCardRepository.save(creditCard);
    }
    
}