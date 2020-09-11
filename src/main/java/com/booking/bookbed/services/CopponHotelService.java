package com.booking.bookbed.services;

import com.booking.bookbed.entities.CopponHotel;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.modelviews.CopponHotelEntity;
import com.booking.bookbed.repositories.CopponHotelRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("copponHotelService")
public class CopponHotelService implements ICopponHotelService {
    @Autowired
    private CopponHotelRepository copponHotelRepository;
    @Autowired
    private HotelService hotelService;

    @Override
    public CopponHotel save(CopponHotel copponHotel) {

        return copponHotelRepository.save(copponHotel);
    }

    @Override
    public CopponHotel findById(int id) {

        return copponHotelRepository.findById(id).get();
    }

    @Override
    public CopponHotelEntity createByCopponEntity(CopponHotelEntity copponHotelEntity) {
   
      try {
        Hotel hotel = hotelService.find(copponHotelEntity.getId());
        if (hotel.getCopponHotel() == null) {
            CopponHotel copponHotel = new CopponHotel();
            copponHotel.convertFromEntity(copponHotelEntity);
            copponHotelRepository.save(copponHotel);
            hotel.setCopponHotel(  copponHotelRepository.save(copponHotel));
            return copponHotelEntity;
        } else {
            CopponHotel copponHotel = hotel.getCopponHotel();
            copponHotel.convertFromEntity(copponHotelEntity);
            copponHotelRepository.save(copponHotel);
            return copponHotelEntity;
        }
      } catch (Exception e) {
        return null;
      }
       
    }

}
