package com.booking.bookbed.services;

import com.booking.bookbed.entities.About;
import com.booking.bookbed.repositories.AboutRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aboutService")
public class AboutService implements IAboutService {
    @Autowired
    private AboutRepository aboutRepository;

    @Override
    public About findById(int id) {

        return aboutRepository.findById(id).get();
    }

    @Override
    public About save(About about) {

        return aboutRepository.save(about);
    }

}
