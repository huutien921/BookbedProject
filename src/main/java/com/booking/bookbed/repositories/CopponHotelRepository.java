package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.CopponHotel;



@Repository("copponHotelRepository")
public interface CopponHotelRepository extends  CrudRepository<CopponHotel,Integer>{

}
