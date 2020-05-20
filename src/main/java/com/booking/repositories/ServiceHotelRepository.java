package com.booking.repositories;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.ServiceHotel;



@Repository("serviceHotelRepository")
public interface ServiceHotelRepository extends  CrudRepository<ServiceHotel,Integer>{

}
