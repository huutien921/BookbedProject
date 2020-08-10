package com.booking.bookbed.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.CategoryBlog;

import com.booking.bookbed.repositories.CategoryBlogRepository;

@Service("categoryBlogService")
public class CategoryBlogService implements ICategoryBlogService {
	@Autowired
	private CategoryBlogRepository categoryBlogRepository;

	@Override
	public List<CategoryBlog> findAllByStatus(boolean stt) {
	
		return categoryBlogRepository.findByStatus(stt);
	}

	@Override
	public Iterable<CategoryBlog> findAll() {
		
		return categoryBlogRepository.findAll();
	}

	@Override
	public CategoryBlog findById(int id) {
		
		return categoryBlogRepository.findById(id).get();
	}

	@Override
	public CategoryBlog save(CategoryBlog categoryBlog) {
	
		return categoryBlogRepository.save(categoryBlog);
	}

	@Override
	public void delete(CategoryBlog categoryBlog) {
	
		 categoryBlogRepository.delete(categoryBlog);;
	}
	

}
