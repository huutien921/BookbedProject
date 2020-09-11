package com.booking.bookbed.controller.partner;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.exceptions.BadRequestException;
import com.booking.bookbed.helper.CheckHelper;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.HotelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("hotelManager")
public class HotelManagerController {
	@Autowired
	private AccountService accountService;
	@Autowired
    private CheckHelper checkHelper;
    @Autowired
	private HotelService hotelService;
    @RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap map, @PathVariable("id") int id, Authentication authentication) {
		Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
		
		if (checkHelper.checkHotelofAccountSession(id, account.getId())) {
		
			Hotel hotel = hotelService.findById(id);
				map.put("hotel", hotel);
				map.put("account", account);
				map.put("title", "Detail");
			
			if (checkHelper.checkRoleHotel(hotel)) {
				return  "hotelManager.detail";
			} else {
				throw new BadRequestException();
			
			}
		} else {
			throw new BadRequestException();
		}

	}
}
