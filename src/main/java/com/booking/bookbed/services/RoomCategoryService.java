package com.booking.bookbed.services;

import com.booking.bookbed.entities.RoomCategory;
import com.booking.bookbed.repositories.RoomCategoryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("roomCategoryService")
public class RoomCategoryService implements IRoomCategoryService {
    @Autowired 
    private RoomCategoryRepository roomCategoryRepository; 
        @Override
        public Iterable<RoomCategory> findAll() {
        
            return roomCategoryRepository.findAll();
        }
}
