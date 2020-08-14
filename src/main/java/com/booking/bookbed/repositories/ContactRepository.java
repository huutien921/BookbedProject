package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.booking.bookbed.entities.Contact;

@Repository("contactRepository")
public interface ContactRepository extends CrudRepository<Contact, Integer> {
	
}
