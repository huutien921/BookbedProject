package com.booking.bookbed.controller.user;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.booking.bookbed.services.BlogService;
import com.booking.bookbed.services.PanelService;
import com.booking.bookbed.services.PartnersService;
import com.booking.bookbed.services.SaleService;


@Controller
@RequestMapping(value = {"","home"})
public class HomeController {
	@Autowired
	private SaleService saleService;
	@Autowired
	private BlogService blogService ;
	@Autowired
	private PartnersService partnersService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(ModelMap map ) {
		map.put("promotions", saleService.findByLimitAndDate(true, 4, new Date()));
		map.put("blogs", blogService.findLimitByStatus(true, 3));
		map.put("about", blogService.findById(1));
		map.put("partnersPayments", partnersService.findByNameAndStt("PAYMENT", true));
		
		try {
			map.put("panel", panelService.findById(1));
			
		} catch (Exception e) {
			map.put("panel", null);
		}
		map.put("title",messageSource.getMessage("nav.home", null, 	LocaleContextHolder.getLocale()));
		return "home.index";
	}
}
