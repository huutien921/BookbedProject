package com.booking.bookbed.services;

import com.booking.bookbed.entities.RoomType;
import com.booking.bookbed.repositories.RoomTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("roomTypeService")
public class RoomTypeService implements IRoomTypeService{
    @Autowired
    private RoomTypeRepository roomTypeRepository;
        @Override
        public Iterable<RoomType> findAll() {
          
            return roomTypeRepository.findAll();
        }
}
