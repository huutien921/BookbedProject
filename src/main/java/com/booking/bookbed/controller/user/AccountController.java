package com.booking.bookbed.controller.user;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.booking.bookbed.services.TypeCardService;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.OrderDetailService;
import com.booking.bookbed.services.PanelService;

@Controller
@RequestMapping("user/account")
public class AccountController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private OrderDetailService orderDetailService; 
	@Autowired
	private TypeCardService typeCardService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping( value = "statusOrder", method = RequestMethod.GET)
	public String statusOrder(Authentication authentication, ModelMap map ) {
		int accountId = accountService.findByUsernameAndStatus(authentication.getName(), true).getId();
		map.put("orderdetails",orderDetailService.findByAccountAndcheckInOut(accountId, new Date()));
		map.put("now", new Date());
		map.put("history", orderDetailService.findByHistory(accountId, new Date()));
		map.put("title",messageSource.getMessage("tag.account.booked", null, 	LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(9));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "account.statusOrder";
	}
	
	@RequestMapping( value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		map.put("title",messageSource.getMessage("tag.account.change", null, 	LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(8));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "account.profile";
	}
	@RequestMapping( value = "surplus", method = RequestMethod.GET)
	public String surplus(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername( authentication.getName()));
		map.put("typeCards", typeCardService.findAll());
		map.put("title",messageSource.getMessage("tag.account.surplus", null, 	LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(10));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "account.surplus";
	}
	@RequestMapping( value = "editEmailNotification", method = RequestMethod.GET)
	public String editEmailNotification(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		map.put("title",messageSource.getMessage("tag.account.promotion", null, 	LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(11));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "account.editEmailNotification";
	}
	@RequestMapping( value = "purchase/list", method = RequestMethod.GET)
	public String purchase(Authentication authentication ,ModelMap map ) {
		map.put("account", accountService.findByUsername(authentication.getName()));
		map.put("title",messageSource.getMessage("tag.account.purchase", null, 	LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(12));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "account.purchase";
	}
}
