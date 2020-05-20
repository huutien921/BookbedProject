package com.booking.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.Blog;
import com.booking.entities.Panel;
import com.booking.entities.Sale;



@Repository("blogRepository")
public interface BlogRepository extends  CrudRepository<Blog,Integer>{
}
