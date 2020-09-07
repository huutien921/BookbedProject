package com.booking.bookbed.controller.partner;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.entities.StarRating;
import com.booking.bookbed.helper.CheckHelper;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.HotelService;
import com.booking.bookbed.services.StarRatingService;
import com.booking.bookbed.validations.HotelValidator;

@Controller
@RequestMapping("partnerManager")
public class PartnerManagerController {
	@Autowired
	private HotelService hotelService;

	@Autowired
	private StarRatingService starRatingService;
	@Autowired
	private UploadFileHelper uploadFileHelper;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CheckHelper checkHelper;
	@Autowired
	private HotelValidator hotelValidator;

	@RequestMapping(value = "hotel", method = RequestMethod.GET)
	public String statusOrder(Authentication authentication, ModelMap map) {
		int accountId = accountService.findByUsernameAndStatus(authentication.getName(), true).getId();
		map.put("hotels", hotelService.findByAccountId(accountId));

		return "partner.manager.hotel";
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(ModelMap map, @PathVariable("id") int id, Authentication authentication) {
		Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);

		if (checkHelper.checkHotelofAccountSession(id, account.getId())) {
			String url = "partner.manager.edit";
			Hotel hotel = hotelService.findById(id);
			map.put("hotel", hotelService.findById(id));
			map.put("starRatings", (List<StarRating>) starRatingService.findAll());
			return checkHelper.checkRoleHotel(hotel, url);
		} else {
			return "error.404";
		}

	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("hotel") @Valid Hotel hotel, BindingResult bindingResult,
			@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, ModelMap map) {
				if (!file.isEmpty()) {
					String fileName = uploadFileHelper.saveFile(file,"rooms"); // save file
					hotel.setImage(fileName);
	
				 }else {
					 hotel.setImage(hotelService.findById(hotel.getId()).getImage());
				 }
				hotelValidator.validate(hotel, bindingResult);
	
		if (bindingResult.hasErrors()) {
			map.put("hotel", hotel);
			map.put("starRatings", (List<StarRating>) starRatingService.findAll());
			return "partner.manager.edit";
		} else {
		
			Hotel hotelBefore = hotelService.find(hotel.getId());

			if (!hotelBefore.getName().equals(hotel.getName()) || !hotelBefore.getCity().equals(hotel.getCity())
					|| !hotelBefore.getWard().equals(hotel.getWard())
					|| !hotelBefore.getCountry().equals(hotel.getCountry())
					|| !hotelBefore.getProvincial().equals(hotel.getProvincial())) {
				hotel.setAccountByIdAcEmployee(null);
			} else {
				hotel.setAccountByIdAcEmployee(hotelBefore.getAccountByIdAcEmployee());
			}
			hotel.setAccountByAccountId(hotelBefore.getAccountByAccountId());
			hotel.setCopponHotel(hotelBefore.getCopponHotel());
			hotel.setStatus(hotelBefore.isStatus());
			Hotel hotelResult = hotelService.save(hotel);
			if (hotelResult != null && hotelResult.getAccountByIdAcEmployee() == null) {

				redirectAttributes.addFlashAttribute("ms", "unactive");
				return "redirect:/partnerManager/hotel";

			} else if (hotelResult != null) {
				redirectAttributes.addFlashAttribute("ms", "ok");
				return "redirect:/partnerManager/hotel";
			}

			else {
				map.put("ms", "failed");
				map.put("hotel", hotel);
				map.put("starRatings", (List<StarRating>) starRatingService.findAll());
				return "partner.manager.edit";
			}
		}

	}
	
}
