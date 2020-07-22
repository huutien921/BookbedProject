package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Blog;
import com.booking.bookbed.entities.Panel;
import com.booking.bookbed.entities.Sale;



@Repository("blogRepository")
public interface BlogRepository extends  CrudRepository<Blog,Integer>{
	//get limit blog
	@Query(value="select * from Blog where status = :status order by id desc limit :n ", nativeQuery = true)
	public List<Blog> findLimitByStatus(@Param("status") boolean status, @Param("n") int n);
}
