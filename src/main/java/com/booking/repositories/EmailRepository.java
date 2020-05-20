package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.Email;



@Repository("emailRepository")
public interface EmailRepository extends  CrudRepository<Email,Integer>{

}
