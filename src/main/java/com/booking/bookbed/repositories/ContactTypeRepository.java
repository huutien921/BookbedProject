package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.booking.bookbed.entities.ContactType;

@Repository("contactTypeRepository")
public interface ContactTypeRepository extends CrudRepository<ContactType, Integer> {

	
	
}
