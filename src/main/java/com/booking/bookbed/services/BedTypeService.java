package com.booking.bookbed.services;

import com.booking.bookbed.entities.BedType;
import com.booking.bookbed.repositories.BedTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("bedTypeService")
public class BedTypeService implements IBedTypeService {
    @Autowired
    private BedTypeRepository bedTypeRepository; 
        @Override
        public Iterable<BedType> findAll() {
            
            return bedTypeRepository.findAll();
        }
}
