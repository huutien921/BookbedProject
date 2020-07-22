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
	public List<Blog> findLimitByStatus(boolean status, int n) {
	
		return blogRepository.findLimitByStatus(status, n);
	}

}
