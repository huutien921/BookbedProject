package com.booking.bookbed.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.entities.Role;
import com.booking.bookbed.entities.RoleAccount;
import com.booking.bookbed.entities.StarRating;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.HotelService;
import com.booking.bookbed.services.PanelService;
import com.booking.bookbed.services.RoleAccountService;
import com.booking.bookbed.services.StarRatingService;
import com.booking.bookbed.validations.HotelValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = { "partner"})
public class PartnerController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private PanelService panelService;
	@Autowired
	private HotelService hotelService;
	@Autowired
	private StarRatingService starRatingService;
	@Autowired
	private HotelValidator hotelValidator;
	@Autowired
	private UploadFileHelper uploadFileHelper ;
	@Autowired
	private RoleAccountService roleAccountService;
	@RequestMapping(value = { "index", "" }, method = RequestMethod.GET)
	public String index(ModelMap map) {
		map.put("title", messageSource.getMessage("nav.partner", null, LocaleContextHolder.getLocale()));
		try {
			map.put("panel", panelService.findById(13));
		} catch (Exception e) {
			map.put("panel", null);
		}

		return "user/partner/index";
	}

	@RequestMapping(value = "createHotel", method = RequestMethod.GET)
	public String createHotel(Authentication authentication, ModelMap map, HttpSession httpSession) {
		String username = authentication.getName();
		map.put("user", accountService.findByUsernameAndStatus(username, true));
		Hotel hotel = new Hotel();
		map.put("hotel", hotel);
		map.put("starRatings", (List<StarRating>) starRatingService.findAll());
		map.put("title", "Create Hotel");
		return "partner.createHotel";
	}

	@RequestMapping(value = "createHotel", method = RequestMethod.POST)
	public String createHotel(@ModelAttribute("hotel") @Valid Hotel hotel,BindingResult bindingResult,
			@RequestParam("file") MultipartFile file,Authentication authentication, RedirectAttributes redirectAttributes, ModelMap map,
			HttpSession httpSession) {
				hotel.setImage(file.getOriginalFilename());
		hotelValidator.validate(hotel, bindingResult);

		if (bindingResult.hasErrors()) {
			map.put("hotel", hotel);
			map.put("starRatings", (List<StarRating>) starRatingService.findAll());
			return "partner.createHotel";

		} else {

			if (!file.isEmpty()) {

				String fileName = uploadFileHelper.saveFile(file, "rooms");
				System.out.println(fileName);
				hotel.setImage(fileName);

			} else {
				hotel.setImage("hotelDefault.jpg");
			}
		

			Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
			hotel.setAccountByAccountId(account);
			hotel.setStatus(false);
			if (hotelService.findByAccountId(account.getId()).isEmpty()) {
				Hotel hotelResult = hotelService.save(hotel);
				Role role = new Role(5);
				RoleAccount roleAccount = new RoleAccount(account, role, true);
				RoleAccount roleAccountResult = roleAccountService.save(roleAccount);
				if (hotelResult != null && roleAccountResult != null) {
					redirectAttributes.addFlashAttribute("ms", "ok");
				
					return "redirect:/partnerManager/hotel";

				} else {
					map.put("hotel", hotel);
					map.put("starRatings", (List<StarRating>) starRatingService.findAll());
					redirectAttributes.addFlashAttribute("ms", "failed");
					return "partner.createHotel";

				}
			} else {

				redirectAttributes.addFlashAttribute("ms", "createService");
				httpSession.setAttribute("hotel", hotel);
				return "redirect:/superuser/servicehotel/buyService";
			}

		}

	}

}
