package com.booking.bookbed.services;

import com.booking.bookbed.entities.StarRating;
import com.booking.bookbed.repositories.StarRatingRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service("starRatingService")
public class StarRatingService implements IStarRatingService {
    @Autowired
    private StarRatingRepository starRatingRepository;

    @Override
    public Iterable<StarRating> findAll() {
      
        return starRatingRepository.findAll();
    }


}
