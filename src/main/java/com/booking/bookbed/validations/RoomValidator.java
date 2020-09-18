package com.booking.bookbed.validations;

import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.helper.Utils;
import com.booking.bookbed.services.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component("roomValidator")
public class RoomValidator implements Validator {
    private String pattern = "-?\\d+(\\.\\d+)?";
    @Autowired
    private RoomService roomService;

    @Override
    public boolean supports(Class<?> clazz) {

        return Room.class.equals(clazz);
    }

    public void validateCustom(Room room, int size, Errors errors) {
      int  imageSize = roomService.findById(room.getId()).getImageRooms().size();
        if (12 - imageSize < size) {
            errors.rejectValue("imageRooms", "room.imageRooms.size");
        }
        validate(room, errors);

    }

    @Override
    public void validate(Object target, Errors errors) {
        Room room = (Room) target;
        if (room.getName().equals("")) {
            errors.rejectValue("name", "room.name.required");
        } else if (room.getName().length() > 250) {
            errors.rejectValue("name", "room.name.length");
        }
        if (room.getSrcIcon().equals("")) {
            errors.rejectValue("srcIcon", "room.srcIcon.required");
        }
        try {
            if (!room.getPrice().toString().matches(pattern)) {
                errors.rejectValue("price", "room.price.matcher");
            } else if (room.getPrice() < 0 || room.getPrice() > 1000000) {
                errors.rejectValue("price", "room.price.out");
            }
        } catch (Exception e) {
            errors.rejectValue("price", "room.price.matcher");
        }
        if (room.getAmountOfBed() == null) {
            errors.rejectValue("amountOfBed", "room.amountOfBed.out");
        } else if (!Utils.isInteger(room.getAmountOfBed())) {
            errors.rejectValue("amountOfBed", "room.amountOfBed.matcher");
        } else if (room.getAmountOfBed() < 0 || room.getAmountOfBed() > 50) {
            errors.rejectValue("amountOfBed", "room.amountOfBed.out");
        }
        if (room.getCapacity() == null) {
            errors.rejectValue("capacity", "room.capacity.out");
        } else if (!Utils.isInteger(room.getCapacity())) {
            errors.rejectValue("capacity", "room.capacity.matcher");
        } else if (room.getCapacity() < 0 || room.getCapacity() > 100) {
            errors.rejectValue("capacity", "room.capacity.out");
        }
        if (room.getAmountOfRoom() == null) {
            errors.rejectValue("amountOfRoom", "room.amountOfRoom.out");
        } else if (!Utils.isInteger(room.getAmountOfRoom())) {
            errors.rejectValue("amountOfRoom", "room.amountOfRoom.matcher");
        } else if (room.getAmountOfRoom() <= 0 || room.getAmountOfRoom() > 1000) {
            errors.rejectValue("amountOfRoom", "room.amountOfRoom.out");
        }

    }
}