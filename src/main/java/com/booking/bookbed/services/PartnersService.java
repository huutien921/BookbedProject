package com.booking.bookbed.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.Partners;

import com.booking.bookbed.repositories.PartnerRepository;

@Service("partnersService")
public class PartnersService implements IPartnersService {
	@Autowired
	private PartnerRepository partnerRepository;
	@Override
	public List<Partners> findByNameAndStt(String name, Boolean stt) {
		return partnerRepository.findByNameAndStt(name, stt);
	}

}
