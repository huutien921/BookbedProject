package com.booking.bookbed.services;

import com.booking.bookbed.entities.CopponHotel;
import com.booking.bookbed.modelviews.CopponHotelEntity;

public interface ICopponHotelService {
    public CopponHotel save(CopponHotel copponHotel);
    public CopponHotelEntity createByCopponEntity(CopponHotelEntity copponHotelEntity);
    public CopponHotel findById(int id);
}
