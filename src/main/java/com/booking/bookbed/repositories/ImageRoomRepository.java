package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.ImageRoom;



@Repository("imageRoomRepository")
public interface ImageRoomRepository extends  CrudRepository<ImageRoom,Integer>{
}
