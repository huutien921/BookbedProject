package com.booking.bookbed.helper;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.services.HotelService;
import com.booking.bookbed.services.OrderDetailService;
import com.booking.bookbed.services.RoomService;



@Component("checkUrlHelper")
public class CheckUrlHelper {
	@Autowired 
	private HotelService hotelService ;
	@Autowired
	private RoomService roomService;
	@Autowired
	private OrderDetailService orderDetailService;

public boolean checkUrlBooking(int roomid, String checkin,
	 String checkout,int rooms , Account account) {
	boolean result = true;
	try {
		
		Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin);
	
		Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout);
		long checkQuantity = orderDetailService.sumQuantityByIdRoomAndDate(roomid, dateCheckIn, dateCheckOut);
		int quanRoom = roomService.findById(roomid).getAmountOfRoom();
		int quanRoomlicensed = (int) (quanRoom - checkQuantity) ;
		System.out.println("so lupng phong "   +quanRoomlicensed);
		if (quanRoomlicensed < rooms) {
			result = false ;
		
		}
		if (roomService.findById(roomid).getHotel().getAccountByAccountId().getId() == account.getId()) {
			result = false;
		}
		
		
	} catch (Exception e) {
		result = false;
	}
	
	return result;
}
public boolean checkUrlBookingDate(int roomid, Date dateCheckIn,
		 Date dateCheckOut,int rooms) {
		boolean result = true;
		try {
			
	
			long checkQuantity = orderDetailService.sumQuantityByIdRoomAndDate(roomid, dateCheckIn, dateCheckOut);	
			int quanRoom = roomService.findById(roomid).getAmountOfRoom();
			int quanRoomlicensed = (int) (quanRoom - checkQuantity) ;
			if (quanRoomlicensed < rooms) {
				result = false ;
			
			}
			
		} catch (Exception e) {
			result = false;
		}
		
		return result;
	}




	
}