package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.BedType;



@Repository("bedTypeRepository")
public interface BedTypeRepository extends  CrudRepository<BedType,Integer>{

}
