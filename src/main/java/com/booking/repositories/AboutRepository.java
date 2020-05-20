package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.About;

@Repository("aboutRepository")
public interface AboutRepository extends CrudRepository<About,Integer> {

	
	
}
