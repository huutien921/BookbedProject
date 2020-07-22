package com.booking.bookbed.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.ServiceHotel;
import com.booking.bookbed.repositories.ServiceHotelRepository;


@Service("serviceHotelService")
public class ServiceHotelService implements IServiceHotelService {
	@Autowired
	private ServiceHotelRepository serviceHotelRepository;

	@Override
	public List<ServiceHotel> findByIdActive(Date today, int id, boolean stt) {

		return serviceHotelRepository.findByIdActive(today, id, stt);
	}

	@Override
	public int getPriorityMax(Date today, int id, boolean stt) {
		int priority = 0;
		if (!findByIdActive(today, id, stt).isEmpty()) {
			for (ServiceHotel serviceHotel : findByIdActive(today, id, stt)) {
				if (serviceHotel.getService().getPriority() > priority) {

					priority = serviceHotel.getService().getPriority();
				}
		}
		
		}
		return priority;
	}

	@Override
	public ServiceHotel save(ServiceHotel serviceHotel) {
		// TODO Auto-generated method stub
		return serviceHotelRepository.save(serviceHotel);
	}

	@Override
	public ServiceHotel findByServiceCreate(int id, int idService, boolean stt) {
		// TODO Auto-generated method stub
		return serviceHotelRepository.findByServiceCreate(id, idService, stt);
	}

}
