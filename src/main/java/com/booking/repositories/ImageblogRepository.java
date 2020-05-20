package com.booking.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.Blog;
import com.booking.entities.Imageblog;



@Repository("imageblogRepository")
public interface ImageblogRepository extends  CrudRepository<Imageblog,Integer>{


}
