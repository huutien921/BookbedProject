package com.booking.bookbed.controller.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.BlogService;
import com.booking.bookbed.services.PartnersService;
import com.booking.bookbed.services.SaleService;


@Controller
@RequestMapping()
public class HomeController {
	@Autowired
	private SaleService saleService;
	@Autowired
	private BlogService blogService ;
	@Autowired
	private PartnersService partnersService;
	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(ModelMap map ) {
		
		map.put("promotions", saleService.findByLimitAndDate(true, 4, new Date()));
		map.put("blogs", blogService.findLimitByStatus(true, 3));
		map.put("partnersPayments", partnersService.findByNameAndStt("PAYMENT", true));
		return "home.index";
	}
}
