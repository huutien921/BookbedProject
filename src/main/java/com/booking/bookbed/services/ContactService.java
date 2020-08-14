package com.booking.bookbed.services;


import com.booking.bookbed.entities.Contact;
import com.booking.bookbed.repositories.ContactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("contactService")
public class ContactService implements IContactService {
@Autowired
private ContactRepository contactRepository ;
    @Override
    public Iterable<Contact> findAll() {
        
        return contactRepository.findAll();
    }

    @Override
    public Contact save(Contact contact) {
      
        return contactRepository.save(contact);
    }

    @Override
    public Contact findById(int id) {
       
        return contactRepository.findById(id).get();
    }

}
