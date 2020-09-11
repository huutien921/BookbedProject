package com.booking.bookbed.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.booking.bookbed.entities.ImageRoom;



@Repository("imageRoomRepository")
public interface ImageRoomRepository extends  CrudRepository<ImageRoom,Integer>{
    @Query(value = "from ImageRoom where room.id = :id")
public List<ImageRoom> findByIdRoom(@Param("id") int id);
}
