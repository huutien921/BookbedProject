package com.booking.bookbed.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.Blog;
import com.booking.bookbed.repositories.BlogRepository;

@Service("blogService")
public class BlogService implements IBlogService {
@Autowired
private BlogRepository blogRepository; 
	@Override
	public List<Blog> findLimitByStatus(final boolean status, final int n) {
	
		return blogRepository.findLimitByStatus(status, n);
	}

	@Override
	public List<Blog> findAllByStatus(boolean status) {
		
		return blogRepository.findAllByStatus(true);
	}

	@Override
	public Blog findById(int id) {
		
		return blogRepository.findById(id).get();
	}

}
