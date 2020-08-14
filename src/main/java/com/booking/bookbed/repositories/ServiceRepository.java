package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Service;





@Repository("serviceRepository")
public interface ServiceRepository extends  CrudRepository<Service,Integer>{

}
