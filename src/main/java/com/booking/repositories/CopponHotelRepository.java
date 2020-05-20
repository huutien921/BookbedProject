package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.CopponHotel;



@Repository("copponHotelRepository")
public interface CopponHotelRepository extends  CrudRepository<CopponHotel,Integer>{

}
