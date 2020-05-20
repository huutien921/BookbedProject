package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.Report;



@Repository("reportRepository")
public interface ReportRepository extends  CrudRepository<Report,Integer>{

}
