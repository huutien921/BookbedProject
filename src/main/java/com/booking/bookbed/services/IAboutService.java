package com.booking.bookbed.services;

import com.booking.bookbed.entities.About;

public interface IAboutService {
public About findById(int id);
public About save(About about);
}
