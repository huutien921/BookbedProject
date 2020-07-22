package com.booking.bookbed.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.Sale;
import com.booking.bookbed.repositories.SaleRepository;

@Service("saleService")
public class SaleService implements ISaleService {
	@Autowired
	private SaleRepository saleRepository;
	@Override
	public List<Sale> findByLimitAndDate(boolean status, int n, Date date) {
		return saleRepository.findByLimitAndDate(status, n, date);
		
	}
	@Override
	public List<Sale> searchSaleByStatus(boolean status) {
		return saleRepository.searchSaleByStatus(status);
	}

	@Override
	public Sale find(int id) {
	return saleRepository.findById(id).get();
	}

	@Override
	public List<Sale> searchLimitSale(boolean status, int n) {
		return saleRepository.searchLimitSale(status, n);
	}

	@Override

	public Sale findByCodeAndDate(String code, Date date) {
	
		return saleRepository.findByCodeAndDate(code, date);}

	public Sale save(Sale sale) {
		return saleRepository.save(sale);

	}

	@Override
	public Sale findNew(boolean stt) {
		// TODO Auto-generated method stub
		return saleRepository.findNew(stt);
	}
	
}
