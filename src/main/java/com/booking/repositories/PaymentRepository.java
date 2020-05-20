package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.Payment;



@Repository("paymentRepository")
public interface PaymentRepository extends  CrudRepository<Payment,Integer>{

}
