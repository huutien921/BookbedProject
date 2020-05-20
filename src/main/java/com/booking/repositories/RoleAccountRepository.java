package com.booking.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.booking.entities.RoleAccount;



@Repository("roleAccountRepository")
public interface RoleAccountRepository extends  CrudRepository<RoleAccount,Integer>{

}
