package com.booking.bookbed.services;

import com.booking.bookbed.entities.Contact;

public interface IContactService {
public Iterable<Contact> findAll();
public Contact save(Contact contact);
public Contact findById(int id);


}
