package com.booking.bookbed.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Imageblog;



@Repository("imageblogRepository")
public interface ImageblogRepository extends  CrudRepository<Imageblog,Integer>{


}
