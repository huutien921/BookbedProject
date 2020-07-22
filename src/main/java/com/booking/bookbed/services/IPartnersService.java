package com.booking.bookbed.services;

import java.util.List;

import com.booking.bookbed.entities.Partners;

public interface IPartnersService {
	public List<Partners> findByNameAndStt(String name ,Boolean stt);
}
