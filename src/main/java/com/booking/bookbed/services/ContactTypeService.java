package com.booking.bookbed.services;

import com.booking.bookbed.entities.ContactType;
import com.booking.bookbed.repositories.ContactTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contactTypeService")
public class ContactTypeService implements IContactTypeService {
    @Autowired
    private ContactTypeRepository contactTypeRepository;

    @Override
    public Iterable<ContactType> findAll() {
     
        return contactTypeRepository.findAll();
    }

    @Override
    public ContactType save(ContactType contactType) {
 
        return contactTypeRepository.save(contactType);
    }

    @Override
    public ContactType findById(int id) {
 
        return contactTypeRepository.findById(id).get();
    }
   

}
