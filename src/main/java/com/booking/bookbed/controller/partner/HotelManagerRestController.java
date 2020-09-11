package com.booking.bookbed.controller.partner;

import javax.validation.Valid;

import com.booking.bookbed.modelviews.CopponHotelEntity;
import com.booking.bookbed.services.CopponHotelService;
import com.booking.bookbed.validations.CopponHotelEntityValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/hotelManager")
public class HotelManagerRestController {
    @Autowired
    private CopponHotelEntityValidator copponHotelEntityValidator;
    @Autowired
    private CopponHotelService  copponHotelService;
    @RequestMapping(value = "discount/create" ,method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE },consumes = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Object> saveDiscount(@RequestBody @Valid CopponHotelEntity copponHotelEntity , BindingResult bindingResult) {
		copponHotelEntityValidator.validate(copponHotelEntity, bindingResult);
			try {
				if (bindingResult.hasErrors()) {
					return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
                }
                
				if (copponHotelService.createByCopponEntity(copponHotelEntity) !=null) {
					return new ResponseEntity<>( copponHotelEntity, HttpStatus.OK);
				
				} else {

					return new ResponseEntity<>( copponHotelEntity, HttpStatus.BAD_REQUEST);
				
				}
			} catch (Exception e) {

				return new ResponseEntity<>( copponHotelEntity, HttpStatus.BAD_REQUEST);
			}}
    
}