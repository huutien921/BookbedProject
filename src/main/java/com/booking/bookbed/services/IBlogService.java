package com.booking.bookbed.services;

import java.util.List;
import com.booking.bookbed.entities.Blog;

public interface IBlogService {
	public List<Blog> findLimitByStatus( boolean status, int n);
}
