package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Role;



@Repository("roleRepository")
public interface RoleRepository extends  CrudRepository<Role,Integer>{

}
