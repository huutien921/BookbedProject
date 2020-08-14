package com.booking.bookbed.repositories;

import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Evaluate;



@Repository("evaluateRepository")
public interface EvaluateRepository extends  CrudRepository<Evaluate,Integer>{

}
