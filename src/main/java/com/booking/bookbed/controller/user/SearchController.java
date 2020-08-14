package com.booking.bookbed.controller.user;

import com.booking.bookbed.services.PanelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value = "search")
public class SearchController {
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = "/**",method = RequestMethod.GET)
	public String index(ModelMap map) {
		map.put("title",messageSource.getMessage("booking.result", null, LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(5));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "search.index";
	}
}
