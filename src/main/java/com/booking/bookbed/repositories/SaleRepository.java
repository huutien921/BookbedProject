package com.booking.bookbed.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.booking.bookbed.entities.Room;
import com.booking.bookbed.entities.Sale;

@Repository("saleRepository")
public interface SaleRepository extends CrudRepository<Sale, Integer> {
	// lay 4 promotion moi nhat nhung con han su dung//
	@Query(value = "select * from Sale where status = :status and startday < :date and endday > :date order by id desc limit :n ", nativeQuery = true)
	public List<Sale> findByLimitAndDate(@Param("status") boolean status, @Param("n") int n, @Param("date") Date date);
	@Query(value="from Sale where status = :status order by id desc")
	public List<Sale> searchSaleByStatus(@Param("status") boolean status);
	@Query(value="select * from Sale where status = :status order by id desc limit :n ", nativeQuery = true)
	public List<Sale> searchLimitSale(@Param("status") boolean status, @Param("n") int n);
	@Query(value = "select * from sale where code = :code and startday < :date and endday > :date " , nativeQuery = true)
	public Sale findByCodeAndDate(@Param("code") String code, @Param("date") Date date);
	@Query(value = "select * from Sale where status = :status and id = (SELECT MAX(id) FROM Sale)" , nativeQuery = true)
	public Sale findNew(@Param("status") boolean stt);
}
