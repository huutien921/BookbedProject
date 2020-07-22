package com.booking.bookbed.repositories;

import com.booking.bookbed.entities.CreditCard;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository("creditCardRepository")
public interface CreditCardRepository extends CrudRepository<CreditCard,Integer> {
    
}