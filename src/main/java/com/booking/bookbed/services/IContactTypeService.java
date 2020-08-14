package com.booking.bookbed.services;

import com.booking.bookbed.entities.ContactType;

public interface IContactTypeService {
public Iterable<ContactType> findAll();
public ContactType save(ContactType contactType);
public ContactType findById(int id);


}
