package com.booking.bookbed.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.TypePart;


@Repository("typePartneRepository")
public interface TypePartnerRepository extends CrudRepository<TypePart,Integer> {
	//@Query("from TypePartners where name =:name")
//	public TypePart findByUsername(@Param("name") String name);
	
}
