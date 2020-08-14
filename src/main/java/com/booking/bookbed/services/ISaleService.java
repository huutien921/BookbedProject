package com.booking.bookbed.services;

import java.util.Date;
import java.util.List;

import com.booking.bookbed.entities.Sale;

public interface ISaleService {
	public List<Sale> findByLimitAndDate(boolean status,int n, Date date);
	public Sale save(Sale sale);
	public Sale find(int id);
	public List<Sale> searchLimitSale(boolean status, int n);
	public List<Sale> searchSaleByStatus(boolean status);
	public Sale findByCodeAndDate(String code,  Date date);
	public Sale findNew(boolean stt);
}
