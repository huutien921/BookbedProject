package com.booking.bookbed.repositories;

import com.booking.bookbed.entities.TypeCard;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
@Repository("typeCardRepository")
public interface TypeCardRepository extends CrudRepository<TypeCard,Integer>{
    
}