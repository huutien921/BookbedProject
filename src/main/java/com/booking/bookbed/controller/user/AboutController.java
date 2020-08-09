package com.booking.bookbed.controller.user;

import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.booking.bookbed.services.BlogService;
import com.booking.bookbed.services.PartnersService;
import com.booking.bookbed.services.SaleService;


@Controller
@RequestMapping(value = {"about"})
public class AboutController {

	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(ModelMap map ) {
		
	
		return "about.index";
	}
}
