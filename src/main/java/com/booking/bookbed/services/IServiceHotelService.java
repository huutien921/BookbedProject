package com.booking.bookbed.services;


import java.util.Date;
import java.util.List;

import com.booking.bookbed.entities.ServiceHotel;

public interface IServiceHotelService {
	public List<ServiceHotel> findByIdActive( Date today,int id,boolean stt);
	public int getPriorityMax(Date today,int id,boolean stt);
	public ServiceHotel save(ServiceHotel serviceHotel);
	public ServiceHotel findByServiceCreate(int id ,int idService,
			boolean stt
			);

}
