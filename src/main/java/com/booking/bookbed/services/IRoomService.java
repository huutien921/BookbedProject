package com.booking.bookbed.services;

import java.util.Date;
import java.util.List;

import com.booking.bookbed.entities.Room;
import com.booking.bookbed.modelviews.RoomEntity;

public interface IRoomService {
	public Iterable<Room> findAll();
	public Room findById(int id);
	public Room save(Room room);
	public List<Room> searchRoomByStatusAndIdHotel(boolean status, int hotel_id);
	public List<RoomEntity> findRoomEntitiesByStatusAndIdHotelAndCheckDate(boolean status, int hotel_id , Date checkIn , Date checkOut , int rooms);
}
