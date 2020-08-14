package com.booking.bookbed.services;

import java.util.Date;
import java.util.List;


import com.booking.bookbed.entities.Orders;

public interface IOrdersService {
	public Orders save(Orders orders);
	public Iterable<Orders> findAll();
	public Orders findById( int id);
	public Orders findOrderNew(int id ,Date date);
	public List<Orders> findOrderByAccount(int id);
	
	
}
