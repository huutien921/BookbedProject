package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Blog;




@Repository("blogRepository")
public interface BlogRepository extends  CrudRepository<Blog,Integer>{
	//get limit blog
	@Query(nativeQuery = true ,value="select * from blog where status = :status order by id desc limit :n ")
	public List<Blog> findLimitByStatus(@Param("status") boolean status, @Param("n") int n);
	@Query( nativeQuery = true, value="select * from blog where status = :status order by id desc ")
	public List<Blog> findAllByStatus(@Param("status") boolean status);
}
