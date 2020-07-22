package com.booking.bookbed.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class HotelExceptionController {
   @ExceptionHandler(value = HotelNotfoundException.class)
   public ResponseEntity<Object> exception(HotelNotfoundException exception) {
      return new ResponseEntity<>("not fount", HttpStatus.NOT_FOUND);
   }
   @ExceptionHandler(value = DateValiException.class)
   public ResponseEntity<Object> exception(DateValiException exception) {
      return new ResponseEntity<>("erro date!", HttpStatus.BAD_REQUEST);
   }

}