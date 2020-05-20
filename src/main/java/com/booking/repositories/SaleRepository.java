package com.booking.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.entities.Room;
import com.booking.entities.Sale;



@Repository("saleRepository")
public interface SaleRepository extends  CrudRepository<Sale,Integer>{

}
