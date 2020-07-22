package com.booking.bookbed.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Partners;
import com.booking.bookbed.entities.TypePart;


@Repository("partnersRepository")
public interface PartnerRepository extends CrudRepository<Partners,Integer> {
	@Query("from Partners where typePart.name = :name and typePart.status = :stt")
	//@Query(value="select * from partners ,type_part where partners.idtype = type_part.id and type_part.name = :name and type_part.status = :stt ", nativeQuery = true)
	public List<Partners> findByNameAndStt(@Param("name") String name , @Param("stt")  Boolean stt);
	
}
