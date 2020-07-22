package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.RoomCategory;



@Repository("roomCategoryRepository")
public interface RoomCategoryRepository extends  CrudRepository<RoomCategory,Integer>{

}
