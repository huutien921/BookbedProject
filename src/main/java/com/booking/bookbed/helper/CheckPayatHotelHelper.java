package com.booking.bookbed.helper;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.booking.bookbed.entities.OrderDetail;
import com.booking.bookbed.services.OrderDetailService;


@Component("checkPayatHotelHelper")
public class CheckPayatHotelHelper {
	@Autowired
	private OrderDetailService orderDetailService;

	public boolean checkorderdetail(int idac) {
		boolean result = true;
		List<OrderDetail> orderDetails = orderDetailService.findByAccountAndcheckInOut(idac, new Date());
		for (OrderDetail orderDetail : orderDetails) {
			if (orderDetail.getOrders().getPayment().equalsIgnoreCase("payathotel") || 
					orderDetail.getOrders().getPayment() == null  ) {
				result = false ;
				break;
			}
		}
		return result ;
	}
	

}
