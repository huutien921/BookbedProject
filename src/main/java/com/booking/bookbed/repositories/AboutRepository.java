package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.About;

@Repository("aboutRepository")
public interface AboutRepository extends CrudRepository<About,Integer> {

	
	
}
