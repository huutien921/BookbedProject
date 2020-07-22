package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.StarRating;



@Repository("starRatingRepository")
public interface StarRatingRepository extends  CrudRepository<StarRating,Integer>{

}
