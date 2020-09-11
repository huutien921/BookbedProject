package com.booking.bookbed.services;

import com.booking.bookbed.entities.BedType;

public interface IBedTypeService {
    public Iterable<BedType> findAll();	
}
