package com.booking.bookbed.services;

import com.booking.bookbed.entities.CreditCard;

public interface ICreditCardRService {
    public Iterable<CreditCard> findAll(); 
    public CreditCard save(CreditCard creditCard);
}