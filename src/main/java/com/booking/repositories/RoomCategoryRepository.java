package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.RoomCategory;



@Repository("roomCategoryRepository")
public interface RoomCategoryRepository extends  CrudRepository<RoomCategory,Integer>{

}
