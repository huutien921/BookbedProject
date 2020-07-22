package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Servicetype;



@Repository("servicetypeRepository")
public interface ServicetypeRepository extends  CrudRepository<Servicetype,Integer>{

}
