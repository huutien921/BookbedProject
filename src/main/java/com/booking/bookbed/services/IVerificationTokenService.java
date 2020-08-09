package com.booking.bookbed.services;

import com.booking.bookbed.entities.VerificationToken;

public interface IVerificationTokenService {
    public VerificationToken save(VerificationToken verificationToken);
    public VerificationToken findByToken(String token);

}