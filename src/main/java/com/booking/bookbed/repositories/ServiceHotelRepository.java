package com.booking.bookbed.repositories;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.ServiceHotel;



@Repository("serviceHotelRepository")
public interface ServiceHotelRepository extends  CrudRepository<ServiceHotel,Integer>{
	//Lay danh sach service khach san da mua con hoat dong
	@Query(value = "select * from service_hotel where ( (  start_date <= :today ) "
			+ "and ( end_date >= :today ) ) and "
			+ "( id_hotel = :id ) and status = :stt",nativeQuery = true)
	public List<ServiceHotel> findByIdActive(@Param("today") Date today
			, @Param("id") int id,@Param("stt") boolean stt);
	@Query(value = "from ServiceHotel where hotel.id = :idHotel and service.id = :idservice and status = :stt")
	public ServiceHotel findByServiceCreate(@Param("idHotel") int id ,@Param("idservice") int idService
			,@Param("stt") boolean stt
			);
}
