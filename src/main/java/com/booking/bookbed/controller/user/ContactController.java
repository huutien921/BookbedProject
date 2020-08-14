package com.booking.bookbed.controller.user;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import com.booking.bookbed.entities.Contact;
import com.booking.bookbed.helper.EmailHelper;
import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.ContactService;
import com.booking.bookbed.services.ContactTypeService;
import com.booking.bookbed.services.PanelService;
import com.booking.bookbed.validations.ContactValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
@RequestMapping(value = { "contact" })
public class ContactController {
	@Autowired
	private ContactTypeService contactTypeService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private ContactValidator contactValidator;
	@Autowired
	private EmailHelper emailHelper ;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = { "index", "" }, method = RequestMethod.GET)
	public String index( ModelMap map) {
		 Contact contact = new Contact();
		map.put("contact", contact);
		map.put("contactTypes", contactTypeService.findAll());
		map.put("title",messageSource.getMessage("nav.contact", null, LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(4));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "contact.index";
	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@ModelAttribute("contact") @Valid  Contact contact,  ModelMap map,  RedirectAttributes attributes, HttpServletRequest request,BindingResult bindingResult ) {
		contactValidator.validate(contact, bindingResult);
		if (bindingResult.hasErrors()) {
			map.put("contact", contact);
			map.put("contactTypes", contactTypeService.findAll());
			try {
				map.put("panel", panelService.findById(4));
			} catch (Exception e) {
				map.put("panel", null);
			}
			return "contact.index";
		}
		try {
			contact.setCreated(new Date());
			contactService.save(contact);
			map.put("contactTypes", contactTypeService.findAll());
			map.put("contact", new Contact());
			emailHelper.sendMailContact(Utils.getBaseURL(request),contact.getEmail());
			attributes.addFlashAttribute("message", "success");
			return "redirect:/contact";
		} catch ( Exception e) {
			map.put("contact", contact);
			map.put("contactTypes", contactTypeService.findAll());
			map.put("message", "failed");
			try {
				map.put("panel", panelService.findById(4));
			} catch (Exception x) {
				map.put("panel", null);
			}
			return "contact.index";
		}

	}
}
