package com.booking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.entities.ReasonReport;



@Repository("reasonReportRepository")
public interface ReasonReportRepository extends  CrudRepository<ReasonReport,Integer>{

}
