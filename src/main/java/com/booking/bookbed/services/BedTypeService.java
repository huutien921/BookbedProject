package com.booking.bookbed.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.BedType;
import com.booking.bookbed.repositories.BedTypeRepository;

@Service("bedTypeService")
public class BedTypeService implements IBedTypeService {
@Autowired
private BedTypeRepository bedTypeRepository; 

}
