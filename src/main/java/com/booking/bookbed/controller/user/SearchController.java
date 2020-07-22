package com.booking.bookbed.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value = "search")
public class SearchController {
	
	@RequestMapping(value = "/**",method = RequestMethod.GET)
	public String index(ModelMap map) {
		
		return "search.index";
	}
}
