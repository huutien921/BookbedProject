package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Email;



@Repository("emailRepository")
public interface EmailRepository extends  CrudRepository<Email,Integer>{

}
