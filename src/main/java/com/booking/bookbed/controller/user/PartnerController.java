package com.booking.bookbed.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value = {"partner"})
public class PartnerController {
	@Autowired
	private MessageSource messageSource;
	@RequestMapping(value = {"index",""} , method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("title",messageSource.getMessage("nav.partner", null, LocaleContextHolder.getLocale()));
		return "user/partner/index";
	}

}
