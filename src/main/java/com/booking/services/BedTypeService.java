package com.booking.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.entities.BedType;
import com.booking.repositories.BedTypeRepository;

@Service("bedTypeService")
public class BedTypeService implements IBedTypeService {
@Autowired
private BedTypeRepository bedTypeRepository; 

}
