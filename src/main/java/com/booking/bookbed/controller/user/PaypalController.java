package com.booking.bookbed.controller.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booking.bookbed.configurations.PaypalPaymentIntent;
import com.booking.bookbed.configurations.PaypalPaymentMethod;
import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.OrderDetail;
import com.booking.bookbed.entities.Orders;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.helper.EmailHelper;
import com.booking.bookbed.helper.PriceHelper;
import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.OrderDetailService;
import com.booking.bookbed.services.OrdersService;
import com.booking.bookbed.services.PaypalService;
import com.booking.bookbed.services.RoomService;
import com.booking.bookbed.services.SaleService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
@RequestMapping("user")
public class PaypalController {
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private SaleService saleService;
	@Autowired
	private PaypalService paypalService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private PriceHelper priceHelper;
	@Autowired
	private EmailHelper emailHelper;

	public static final String URL_PAYPAL_SUCCESS = "/pay/success";
	public static final String URL_PAYPAL_CANCEL = "/pay/cancel";
	public static final String URL_PAYPAL_SUCCESS_BACK = "back/pay/success";
	public static final String URL_PAYPAL_CANCEL_BACK = "back/pay/cancel";

	@PostMapping("/pay")
	public String pay(HttpServletRequest request, @RequestParam("idRoom") int idRoom,
			@RequestParam("checkIn_date") String checkin, @RequestParam("checkOut_date") String checkout,
			@RequestParam("rooms") int rooms, @RequestParam("nameStaying") String name,
			@RequestParam("email") String email, @RequestParam("note") String note,
			@RequestParam("giftCode") String code, RedirectAttributes redirectAttributes, HttpSession httpSession

	) throws ParseException {

		try {
			Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin);
			Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout);
			long getDiff = dateCheckOut.getTime() - dateCheckIn.getTime();
			long getDayDiff = TimeUnit.MILLISECONDS.toDays(getDiff);
			Account account = accountService.findByUsernameAndStatus("tien_user", true);
			Orders orders = new Orders();

			orders.setCreated(new Date());
			orders.setAccount(account);
			if (saleService.findByCodeAndDate(code, new Date()) != null) {
				orders.setSale(saleService.findByCodeAndDate(code, new Date()));
			}
			Room room = roomService.findById(idRoom);
			orders.setStatus(false);
			httpSession.setAttribute("order", orders);

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setRoom(room);
			orderDetail.setCheckInDate(dateCheckIn);
			orderDetail.setCheckOutDate(dateCheckOut);
			orderDetail.setQuantity(rooms);
			orderDetail.setNamestaying(name);
			orderDetail.setEmail(email);
			orderDetail.setNote(note);
			orderDetail.setStatus(true);
			httpSession.setAttribute("orderdetail", orderDetail);
			httpSession.setAttribute("request", request);
			String cancelUrl = Utils.getBaseURL(request) + "/user/" + URL_PAYPAL_CANCEL;
			String successUrl = Utils.getBaseURL(request) + "/user/" + URL_PAYPAL_SUCCESS;
			double price = priceHelper.calculatorPrice(room, rooms, (int) getDayDiff, code);

			Payment payment = paypalService.createPayment(price, "USD", PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale, "payment order Hotel", cancelUrl, successUrl);
			for (Links links : payment.getLinks()) {
				if (links.getRel().equals("approval_url")) {
					return "redirect:" + links.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}

	@GetMapping(URL_PAYPAL_CANCEL)
	public String cancelPay(RedirectAttributes redirectAttributes, HttpSession httpSession) {
		redirectAttributes.addFlashAttribute("ms", "failed");
		httpSession.removeAttribute("order");
		httpSession.removeAttribute("orderdetail");
		httpSession.removeAttribute("request");
		return "redirect:/user/account/statusOrder";
	}

	@GetMapping(URL_PAYPAL_SUCCESS)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,
			HttpSession httpSession, RedirectAttributes redirectAttributes

	) throws MessagingException {

		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if (payment.getState().equals("approved")) {
				

				if (httpSession.getAttribute("order") == null || httpSession.getAttribute("orderdetail") == null) {

					redirectAttributes.addFlashAttribute("ms", "failed");

					return "redirect:/user/account/statusOrder";
				} else {

					Orders orders = (Orders) httpSession.getAttribute("order");

					OrderDetail orderDetail = (OrderDetail) httpSession.getAttribute("orderdetail");
					orderDetail.setOrders(orders);
					orders.setName(payerId);
					orders.setPayment(paymentId);
					orders.setStatus(false);
					Orders ordersResult = ordersService.save(orders);
					if (ordersResult != null) {
						OrderDetail orderDetailResult = orderDetailService.save(orderDetail);
						HttpServletRequest request = (HttpServletRequest)httpSession.getAttribute("request");
						String sub = "BookBed - Hotel reservation invoice - ";
						emailHelper.sendMailBooking(orderDetailResult, Utils.getBaseURL(request),"template_booking.html",sub);
					}
					httpSession.removeAttribute("order");
					httpSession.removeAttribute("orderdetail");
					httpSession.removeAttribute("request");
					redirectAttributes.addFlashAttribute("ms", "ok");

					return "redirect:/user/account/statusOrder";
				}
			}

		} catch (PayPalRESTException e) {
			redirectAttributes.addFlashAttribute("ms", "failed");

			return "redirect:/user/account/statusOrder";
		}
		redirectAttributes.addFlashAttribute("ms", "failed");

		return "redirect:/user/account/statusOrder";

	}



	@PostMapping("back/pay")
	public String pay(@RequestParam("idOrder") int idOrder, HttpServletRequest request,
			RedirectAttributes redirectAttributes, HttpSession httpSession

	) throws ParseException {

		try {

			String cancelUrl = Utils.getBaseURL(request) + "/user/" + URL_PAYPAL_CANCEL_BACK;
			String successUrl = Utils.getBaseURL(request) + "/user/" + URL_PAYPAL_SUCCESS_BACK;
			OrderDetail orderDetailResult = orderDetailService.findById(idOrder);
			httpSession.setAttribute("detail", orderDetailResult);
			httpSession.setAttribute("request", request);
			Payment payment = paypalService.createPayment(orderDetailResult.getOrders().getTotalPrice(), "USD",
					PaypalPaymentMethod.paypal, PaypalPaymentIntent.sale, "payment order Hotel", cancelUrl, successUrl);
			for (Links links : payment.getLinks()) {
				if (links.getRel().equals("approval_url")) {
					return "redirect:" + links.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}

	@GetMapping(URL_PAYPAL_CANCEL_BACK)
	public String cancelPayBack(RedirectAttributes redirectAttributes , HttpSession httpSession) {
		redirectAttributes.addFlashAttribute("ms", "payfailed");
		httpSession.removeAttribute("detail");
		httpSession.removeAttribute("request");
		return "redirect:/user/account/statusOrder";
	}

	@GetMapping(URL_PAYPAL_SUCCESS_BACK)
	public String successPayBack(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,
			HttpSession httpSession, RedirectAttributes redirectAttributes

	) throws MessagingException {

		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if (payment.getState().equals("approved")) {
				
				if (httpSession.getAttribute("detail") == null) {

					redirectAttributes.addFlashAttribute("ms", "failed");

					return "redirect:/user/account/statusOrder";
				} else {

					OrderDetail orderDetail = (OrderDetail) httpSession.getAttribute("detail");
					HttpServletRequest request = (HttpServletRequest)httpSession.getAttribute("request");
					Orders orders = orderDetail.getOrders();
					orders.setPayment(paymentId);
					orders.setName(payerId);
					ordersService.save(orders);
					String sub = "BookBed - Hotel payment invoice - ";
					emailHelper.sendMailBooking(orderDetail, Utils.getBaseURL(request),"template_booking_payment.html",sub);
	
					httpSession.removeAttribute("detail");
					httpSession.removeAttribute("request");
					redirectAttributes.addFlashAttribute("ms", "payok");

					return "redirect:/user/account/statusOrder";
				}
			}

		} catch (PayPalRESTException e) {
			redirectAttributes.addFlashAttribute("ms", "payfailed");

			return "redirect:/user/account/statusOrder";
		}
		redirectAttributes.addFlashAttribute("ms", "payfailed");

		return "redirect:/user/account/statusOrder";

	}

}
