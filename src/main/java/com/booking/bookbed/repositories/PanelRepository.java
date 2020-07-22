package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Panel;



@Repository("panelRepository")
public interface PanelRepository extends  CrudRepository<Panel,Integer>{

}
