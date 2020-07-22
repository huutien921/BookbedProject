package com.booking.bookbed.services;

import com.booking.bookbed.entities.TypeCard;

public interface ITypeCardService {
    public Iterable<TypeCard> findAll();
    public TypeCard findById(int  id);
}