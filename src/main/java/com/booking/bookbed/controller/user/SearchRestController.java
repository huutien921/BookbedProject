package com.booking.bookbed.controller.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.booking.bookbed.modelviews.HotelEntity;
import com.booking.bookbed.modelviews.SearchInfo;
import com.booking.bookbed.exceptions.HotelNotfoundException;
import com.booking.bookbed.services.HotelService;

@RestController
@RequestMapping("api/search")
public class SearchRestController {
	@Autowired
	private HotelService hotelService;

	// search hotel in ajax page index
	@RequestMapping(value = "spec", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> search(@RequestParam("checkin_date") String checkin_date,
			@RequestParam("checkout_date") String checkout_date, @RequestParam("rooms") String rooms,
			@RequestParam("guests") String guests, @RequestParam("destination") String address) {
		List<HotelEntity> hotels = new ArrayList<HotelEntity>();
		try {
			Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin_date);
			Date now = new Date();
			Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout_date);
			//validation form search 
			if (address == null || address.isEmpty() || dateCheckOut.getTime() < dateCheckIn.getTime() || guests == null
					|| Integer.parseInt(guests) <= 0 || rooms == null || Integer.parseInt(rooms) <= 0
					|| dateCheckIn.getTime() < now.getTime()) {
				throw new Exception("err search");
			}

			hotels = hotelService.searchByAddressAddPriorityJson(address, dateCheckIn, dateCheckOut,
					Integer.parseInt(guests), Integer.parseInt(rooms));
		} catch (Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		if (hotels.size() == 0)
			throw new HotelNotfoundException();
		return new ResponseEntity<>(hotels, HttpStatus.OK);

	}

	// search ajax autocomplete
	@RequestMapping(value = "address", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> findAddress(@RequestParam("key") String key) {

		try {
			return new ResponseEntity<>(hotelService.searchComplete(key), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	// filter hotel price
	@RequestMapping(value = "price", method = RequestMethod.POST, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> findByPrice(@RequestBody SearchInfo searchInfo) {
		List<HotelEntity> hotels = new ArrayList<HotelEntity>();
		try {
			hotels = hotelService.searchByAddressAddPriorityAddStarJsonObject(searchInfo); 
			System.out.println("result " + hotels.size());
		
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
			if(hotels.size() == 0)throw new HotelNotfoundException();
			return new ResponseEntity<>(hotels,HttpStatus.OK);
			
		
	}
}
