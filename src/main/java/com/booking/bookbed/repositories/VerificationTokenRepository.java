package com.booking.bookbed.repositories;

import com.booking.bookbed.entities.VerificationToken;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("verificationTokenRepository")
public interface VerificationTokenRepository extends CrudRepository<VerificationToken,Integer> {
    @Query("from VerificationToken where token =:token")
	public VerificationToken findByToken(@Param("token") String token);
}