package com.booking.bookbed.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

import com.booking.bookbed.entities.Room;
import com.booking.bookbed.entities.Sale;
import com.booking.bookbed.services.SaleService;

@Component
public class PriceHelper {
	@Autowired
	private SaleService saleService;

	public  double calculatorPrice( Room room , int rooms , int days ,  String code ) {
		double copHotel = 0;
		double copRoom = 0 ;
	
		if (room.getHotel().getCopponHotel() != null) {
			copHotel = room.getHotel().getCopponHotel().getSale();
			
		}
		 if (room.getCopponRoom() != null) {
			copRoom = room.getCopponRoom().getSale() ;
			
		 }
		 double finalPrice = days * room.getPrice() * rooms ;
		 
		 finalPrice = finalPrice * (1 - (copHotel + copRoom)/100) ;
		 if(code != null) {
			Sale saleResult = saleService.findByCodeAndDate(code, new Date());
			if (saleResult != null) {
				double price = finalPrice * (1-(saleResult.getSales()/100));
				return (double) Math.round(price * 100) / 100;
				
			}else {
				
				return (double) Math.round(finalPrice * 100) / 100; 
			}
		 }else {return (double) Math.round(finalPrice * 100) / 100; }
		
	}
}
