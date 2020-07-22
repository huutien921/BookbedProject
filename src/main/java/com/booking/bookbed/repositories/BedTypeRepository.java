package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.BedType;



@Repository("bedTypeRepository")
public interface BedTypeRepository extends  CrudRepository<BedType,Integer>{

}
