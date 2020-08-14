package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.ImageRoom;



@Repository("imageRoomRepository")
public interface ImageRoomRepository extends  CrudRepository<ImageRoom,Integer>{
}
