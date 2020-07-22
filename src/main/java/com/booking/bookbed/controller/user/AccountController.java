package com.booking.bookbed.controller.user;

import java.util.Date;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booking.bookbed.services.TypeCardService;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.OrderDetailService;




@Controller
@RequestMapping("user/account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private OrderDetailService orderDetailService; 
	@Autowired
	private TypeCardService typeCardService;

	private String username = "tien_user";

	@RequestMapping( value = "statusOrder", method = RequestMethod.GET)
	public String statusOrder(Authentication authentication, ModelMap map ) {
		
	
		int accountid = accountService.findByUsernameAndStatus(username, true).getId();
	
		map.put("orderdetails",orderDetailService.findByAccountAndcheckInOut(accountid, new Date()));
		
		map.put("now", new Date());
		map.put("history", orderDetailService.findByHistory(accountid, new Date()));
		map.put("title", "My order");
		return "account.statusOrder";
	}
	
	@RequestMapping( value = "profile", method = RequestMethod.GET)
	public String profile(ModelMap map ) {
		map.put("account", accountService.findByUsername(username));
		map.put("title", "Profile");
		return "account.profile";
	}
	@RequestMapping( value = "surplus", method = RequestMethod.GET)
	public String surplus(ModelMap map ) {
		map.put("account", accountService.findByUsername(username));
		map.put("typeCards", typeCardService.findAll());
		map.put("title", "Surplus");
		return "account.surplus";
	}

}
