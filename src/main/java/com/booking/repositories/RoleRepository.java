package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.Role;



@Repository("roleRepository")
public interface RoleRepository extends  CrudRepository<Role,Integer>{

}
