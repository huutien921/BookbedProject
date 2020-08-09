package com.booking.bookbed.services;


import com.booking.bookbed.entities.VerificationToken;
import com.booking.bookbed.repositories.VerificationTokenRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("verificationTokenService")
public class VerificationTokenService implements IVerificationTokenService {
@Autowired
private VerificationTokenRepository verificationTokenRepository;
    @Override
    public VerificationToken save(VerificationToken verificationToken) {
       
        return verificationTokenRepository.save(verificationToken);
    }

    @Override
    public VerificationToken findByToken(String token) {
      
        return verificationTokenRepository.findByToken(token);
    }
    
}