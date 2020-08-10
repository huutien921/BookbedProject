package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.CategoryBlog;




@Repository("categoryBlogRepository")
public interface CategoryBlogRepository extends  CrudRepository<CategoryBlog,Integer>{
	@Query(value = "from CategoryBlog where status =:stt")
	public  List<CategoryBlog> findByStatus(@Param("stt")boolean stt);

}
