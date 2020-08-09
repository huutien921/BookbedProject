package com.booking.bookbed.controller.user;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.OrderDetail;
import com.booking.bookbed.entities.Orders;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.entities.Sale;
import com.booking.bookbed.helper.CheckPayatHotelHelper;
import com.booking.bookbed.helper.CheckUrlHelper;
import com.booking.bookbed.helper.EmailHelper;
import com.booking.bookbed.helper.PriceHelper;

import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.OrderDetailService;
import com.booking.bookbed.services.OrdersService;
import com.booking.bookbed.services.RoomService;
import com.booking.bookbed.services.SaleService;

@Controller
@RequestMapping(value = { "booking" })
public class BookingController {
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private SaleService saleService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CheckPayatHotelHelper checkPayatHotelHelper;
	@Autowired
	private CheckUrlHelper checkUrlHelper;
	@Autowired
	private PriceHelper priceHelper;
	@Autowired
	private EmailHelper emailHelper;
	
	private OrderDetail orderDetailResult ;

	@RequestMapping(method = RequestMethod.GET)
	public String booking(Authentication authentication ,@RequestParam("roomid") int roomid, @RequestParam("checkin_date") String checkin_date,
			@RequestParam("checkout_date") String checkout_date, @RequestParam("rooms") int rooms, ModelMap map

	) throws MessagingException {
	
		if (checkUrlHelper.checkUrlBooking(roomid, checkin_date, checkout_date, rooms ,accountService.findByUsernameAndStatus("tien_user", true))) {
		try {
			Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin_date);
			Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout_date);
			long getDiff = dateCheckOut.getTime() - dateCheckIn.getTime();
			long getDayDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
		// tinh tien
			Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
		Room room =  roomService.findById(roomid);
		double finalPrice = priceHelper.calculatorPrice(room, rooms, (int) getDayDiff, null);
			map.put("roomquan", rooms);
			map.put("room", room);
			map.put("finalPrice",finalPrice);
			map.put("days", getDayDiff);
			map.put("checkin", checkin_date);
			map.put("checkout", checkout_date);
			map.put("user", account);
			map.put("title", "Booking");

		} catch (Exception e) {
			System.out.println(e.toString());
			return "redirect:/home";
		}
		return "user.booking";
		} else {
			
			return "redirect:/home";
		}
	
	}

	@RequestMapping(method = RequestMethod.POST)
	public String booking(Authentication authentication ,@RequestParam("idRoom") int idRoom, @RequestParam("checkIn_date") String checkin,
			@RequestParam("checkOut_date") String checkout, @RequestParam("rooms") int rooms
			, @RequestParam("nameStaying") String name, @RequestParam("email") String email,
			@RequestParam("note") String note,
			@RequestParam("giftCode") String code ,RedirectAttributes redirectAttributes,HttpServletRequest request ) {
		boolean result = true;
		Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
		if (checkPayatHotelHelper.checkorderdetail(account.getId())) {
			
		try {
			Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin);
			Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout);
			long getDiff = dateCheckOut.getTime() - dateCheckIn.getTime();
			long getDayDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
				Orders orders = new Orders();
				orders.setName("payathotel");
				orders.setPayment("payathotel");
				orders.setCreated(new Date());
				orders.setAccount(account);
				Sale sale = saleService.findByCodeAndDate(code, new Date()) ;
				double priceTotal = 0 ;
				if (sale != null) {
					orders.setSale(sale);
					 priceTotal = priceHelper.calculatorPrice(roomService.findById(idRoom), rooms, (int)getDayDiff, code);
				}else{
					 priceTotal = priceHelper.calculatorPrice(roomService.findById(idRoom), rooms, (int)getDayDiff, null);
				}
				orders.setTotalPrice(priceTotal);
				orders.setStatus(false);
				Orders orderResult = ordersService.save(orders);
				if (orderResult != null) {
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setRoom(roomService.findById(idRoom));
					orderDetail.setCheckInDate(dateCheckIn);
					orderDetail.setCheckOutDate(dateCheckOut);
					orderDetail.setQuantity(rooms);
					if(name == "" || name == null){	orderDetail.setNamestaying(account.getFullname());}else{
						orderDetail.setNamestaying(name);
					}
					if(email == "" ||email == null){	orderDetail.setEmail(account.getEmail());}else{
						orderDetail.setEmail(email);
					}
					
					
					orderDetail.setNote(note);
					orderDetail.setOrders(orderResult);
					orderDetail.setStatus(true);
					 orderDetailResult = orderDetailService.save(orderDetail);
				
					if (orderDetailResult == null) {
						result = false ;
					}
				}else {result = false;}
				if (result) {
					String sub = "BookBed - Hotel reservation invoice - ";
					emailHelper.sendMailBooking(orderDetailResult, Utils.getBaseURL(request) ,"template_booking.html",sub);
					redirectAttributes.addFlashAttribute("ms", "ok");
					
					return "redirect:/user/account/statusOrder";
				}else {
					redirectAttributes.addFlashAttribute("ms", "failed");
					System.out.println("filed1");
					return "redirect:/user/account/statusOrder";
				}
			

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("ms", "failed");
			System.out.println("filed2");
			return "redirect:/user/account/statusOrder";
		}
		} else {
			redirectAttributes.addFlashAttribute("ms", "pay");
			System.out.println("filed3");
			return "redirect:/user/account/statusOrder";
		}
	}

	@RequestMapping(value = "api/code", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Object> checkCodeSale(@RequestParam("valueCode") String code) {

		Sale saleResult = saleService.findByCodeAndDate(code, new Date());
		if (saleResult != null) {
			return new  ResponseEntity<>(saleResult,HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

	}

}
