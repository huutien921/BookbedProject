package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.CopponRoom;



@Repository("copponRoomRepository")
public interface CopponRoomRepository extends  CrudRepository<CopponRoom,Integer>{

}
