package com.booking.bookbed.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.services.HotelService;
import com.booking.bookbed.services.PanelService;
import com.booking.bookbed.services.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
@RequestMapping(value = "hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private RoomService roomService ;
	@Autowired
	private PanelService panelService;
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public String index(@RequestParam("idHotel") String id ,@RequestParam("checkin_date") String checkin_date,
	@RequestParam("checkout_date") String checkout_date, @RequestParam("rooms") String rooms , ModelMap map) {
		Hotel hotel =  hotelService.findById(Integer.parseInt(id));
		map.put("hotel",hotel);
		map.put("title",hotel.getName());
		try {
			map.put("panel", panelService.findById(6));
		} catch (Exception e) {
			map.put("panel", null);
		}
		return "hotel.detail";
	}
	@RequestMapping(value = "room", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> findAddress(@RequestParam("idHotel") String id ,@RequestParam("checkin_date") String checkin_date,
	@RequestParam("checkout_date") String checkout_date, @RequestParam("rooms") String rooms) {
		try {
			Date dateCheckIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin_date);
			Date dateCheckOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout_date);
			return new ResponseEntity<>(roomService.findRoomEntitiesByStatusAndIdHotelAndCheckDate(true, Integer.parseInt(id), dateCheckIn, dateCheckOut, Integer.parseInt(rooms)), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
