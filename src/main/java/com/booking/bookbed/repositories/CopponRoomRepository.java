package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.CopponRoom;



@Repository("copponRoomRepository")
public interface CopponRoomRepository extends  CrudRepository<CopponRoom,Integer>{

}
