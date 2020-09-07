package com.booking.bookbed.services;

import com.booking.bookbed.entities.RoomType;

public interface IRoomTypeService {
    public Iterable<RoomType> findAll();
}
