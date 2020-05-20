package com.booking.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.Service;
import com.booking.entities.ServiceGroup;




@Repository("serviceRepository")
public interface ServiceRepository extends  CrudRepository<Service,Integer>{

}
