package com.booking.bookbed.controller.user;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("error")
public class ErrorController {
	@RequestMapping( value = "token", method = RequestMethod.GET)
	public String token() {
		return "user/error/token";
	}
}
