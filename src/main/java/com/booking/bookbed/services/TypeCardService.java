package com.booking.bookbed.services;

import com.booking.bookbed.entities.TypeCard;
import com.booking.bookbed.repositories.TypeCardRepository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("typeCardService")
public class TypeCardService implements ITypeCardService {
    @Autowired
    private TypeCardRepository typeCardRepository;

    @Override
    public Iterable<com.booking.bookbed.entities.TypeCard> findAll() {

        return typeCardRepository.findAll();
    }

    @Override
    public TypeCard findById(int id) {
        // TODO Auto-generated method stub
        return typeCardRepository.findById(id).get();
    }
    
}