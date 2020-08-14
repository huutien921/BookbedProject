package com.booking.bookbed.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Panel;



@Repository("panelRepository")
public interface PanelRepository extends  CrudRepository<Panel,Integer>{

}
