package com.booking.bookbed.services;

import java.util.List;

import com.booking.bookbed.entities.CategoryBlog;

public interface ICategoryBlogService {
public List<CategoryBlog> findAllByStatus(boolean stt);
public Iterable<CategoryBlog> findAll();
public CategoryBlog findById(int id);
public CategoryBlog save(CategoryBlog categoryBlog);
public void delete(CategoryBlog categoryBlog);

}
