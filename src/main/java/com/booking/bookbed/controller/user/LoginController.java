package com.booking.bookbed.controller.user;

import java.util.Date;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.VerificationToken;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.VerificationTokenService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("account")
public class LoginController {

	@Autowired
	private VerificationTokenService tokenService;
	@Autowired
	private AccountService accountService;
	@RequestMapping( value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(required = false)   String username , @RequestParam(value = "error", required = false) String error,
	@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		if (error != null) {
			modelMap.put("msg", "failed");
		}
		// logout
		if (logout != null) {
			modelMap.put("msg", "logout");
		}
		modelMap.put("username", username);
		return "account.login";
	}

	@RequestMapping( value = "register", method = RequestMethod.GET)
	public String register() {
	
		return "account.register";
	}
	@RequestMapping( value = "registerConfirm", method = RequestMethod.GET)
	public String confirm(ModelMap modelMap,@RequestParam("token") String token , RedirectAttributes attributes) {
	VerificationToken tokenConfirm = tokenService.findByToken(token); 
	if (tokenConfirm == null) {
	attributes.addFlashAttribute("token.error", "token.error.not_found");
		return "redirect:/error/token";
	} 
	if (tokenConfirm.isStatus()) {
		attributes.addFlashAttribute("token.error", "token.error.used");
			return "redirect:/error/token";
		} 
	Date dateNow = new Date();
	if ((tokenConfirm.getExpiryDate().getTime() - dateNow.getTime()) <= 0){
		attributes.addFlashAttribute("token.error", "token.error.expired");
		return "redirect:/error/token";
	}
	Account account = tokenConfirm.getAccount();
	account.setStatus(true);
	accountService.save(account);
	tokenConfirm.setStatus(true);
	tokenService.save(tokenConfirm);
	attributes.addFlashAttribute("token", "active");
		return "redirect:/user/account/profile";
	}
	@RequestMapping( value = "recovery", method = RequestMethod.GET)
	public String recovery() {
	
		return "account.recovery";
	}
	@RequestMapping( value = "recoveryConfirm", method = RequestMethod.GET)
	public String recovery(ModelMap modelMap,@RequestParam("token") String token , RedirectAttributes attributes) {
	 VerificationToken tokenConfirm = tokenService.findByToken(token); 
	 if (tokenConfirm == null) {
	 attributes.addFlashAttribute("token.error", "token.error.not_found");
	 	return "redirect:/error/token";
	 } 
	 if (tokenConfirm.isStatus()) {
		attributes.addFlashAttribute("token.error", "token.error.used");
			return "redirect:/error/token";
		} 
	Date dateNow = new Date();
	if ((tokenConfirm.getExpiryDate().getTime() - dateNow.getTime()) <= 0){
	 	attributes.addFlashAttribute("token.error", "token.error.expired");
		return "redirect:/error/token";
	}

		return "account.resetPassword";
	}

}
