package com.booking.bookbed.controller.user;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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

	

	@RequestMapping( value = "statusOrder", method = RequestMethod.GET)
	public String statusOrder(Authentication authentication, ModelMap map ) {
		
	
		int accountid = accountService.findByUsernameAndStatus(authentication.getName(), true).getId();
	
		map.put("orderdetails",orderDetailService.findByAccountAndcheckInOut(accountid, new Date()));
		
		map.put("now", new Date());
		map.put("history", orderDetailService.findByHistory(accountid, new Date()));
		map.put("title", "My order");
		return "account.statusOrder";
	}
	
	@RequestMapping( value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		map.put("title", "Profile");
		return "account.profile";
	}
	@RequestMapping( value = "surplus", method = RequestMethod.GET)
	public String surplus(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername( authentication.getName()));
		map.put("typeCards", typeCardService.findAll());
		map.put("title", "Surplus");
		return "account.surplus";
	}
	@RequestMapping( value = "editEmailNotification", method = RequestMethod.GET)
	public String editEmailNotification(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		
		return "account.editEmailNotification";
	}
	@RequestMapping( value = "purchase/list", method = RequestMethod.GET)
	public String purchase(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		
		return "account.purchase";
	}
}
