package com.booking.bookbed.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.entities.RoomEntity;
import com.booking.bookbed.repositories.RoomRepository;

@Service("romService")
public class RoomService implements IRoomService {

	@Autowired
	private RoomRepository roomRepository;
	@Autowired 
	private OrderDetailService orderDetailService;

	@Override
	public Iterable<Room> findAll() {

		return roomRepository.findAll();
	}

	@Override
	public Room findById(int id) {
		// TODO Auto-generated method stub
		return roomRepository.findById(id).get();
	}

	@Override
	public Room save(Room room) {
		// TODO Auto-generated method stub
		return roomRepository.save(room);
	}

	@Override
	public List<Room> searchRoomByStatusAndIdHotel(boolean status, int hotel_id) {
		return roomRepository.searchRoomByStatusAndIdHotel(status, hotel_id);
	}
	

	public List<RoomEntity> parseToRoomEntities(List<Room> rooms , Date checkIn , Date checkOut , int quRoom){
		List<RoomEntity> entities = new ArrayList<RoomEntity>();
		for (Room room : rooms) {
			RoomEntity entity = new RoomEntity() ;
			entity.setId(room.getId().toString());
			entity.setName(room.getName());
			entity.setPrice(room.getPrice().toString());
			if (room.getHotel().getCopponHotel() !=  null){
				if (room.getCopponRoom() != null) {
					double saleValue = room.getCopponRoom().getSale() + room.getHotel().getCopponHotel().getSale();
					entity.setSale(String.valueOf(saleValue));
				double priceCoppon = room.getPrice()*(1 -(room.getCopponRoom().getSale()/100 + room.getHotel().getCopponHotel().getSale()/100 ));
				entity.setPriceCoppon(String.valueOf((double) Math.round(priceCoppon * 100) / 100));
				}else{
					entity.setSale(room.getHotel().getCopponHotel().getSale().toString());
					double priceCoppon = room.getPrice()*(1 - room.getHotel().getCopponHotel().getSale()/100 );
			
					entity.setPriceCoppon(String.valueOf(String.valueOf((double) Math.round(priceCoppon * 100) / 100)));
				}
			}else {
			if (room.getCopponRoom() != null) {
				entity.setSale(room.getCopponRoom().getSale().toString());
			Double priceCoppon = room.getPrice()*((100 -room.getCopponRoom().getSale())/100);
			entity.setPriceCoppon(priceCoppon.toString());
			}else{
				entity.setSale(null);
				entity.setPriceCoppon(null);
			}}
			
			entity.setImage(room.getSrcIcon());
			List<String> listTemp = new ArrayList<>();
			for (ImageRoom imageRoom : room.getImageRooms()) {
				if (imageRoom.isStatus()) {
					listTemp.add(imageRoom.getSrc());
				}
			}
			entity.setImages(listTemp);
			entity.setAmountOfBed(room.getAmountOfBed().toString());
			entity.setCapacity(room.getCapacity().toString());
			entity.setAmountOfRoom(room.getAmountOfRoom().toString());
			entity.setRoomType(room.getRoomType().getName());
			entity.setRoomCategory(room.getRoomCategory().getName());
			entity.setBedType(room.getBedType().getName());
			// check room date
		Long qRoom =	orderDetailService.sumQuantityByIdRoomAndDate(room.getId(), checkIn, checkOut);
		if ((room.getAmountOfRoom() - qRoom) >= quRoom) {
				entity.setStatus(true);
			}else{
				entity.setStatus(false);
			}
		entities.add(entity);

		
	}
	return entities;
}

@Override
public List<RoomEntity> findRoomEntitiesByStatusAndIdHotelAndCheckDate(boolean status, int hotel_id,
		Date checkIn, Date checkOut, int rooms) {
			List<Room> listRoom = searchRoomByStatusAndIdHotel(status, hotel_id);
		
			List<RoomEntity> roomEntities = parseToRoomEntities(listRoom, checkIn, checkOut, rooms);
	return roomEntities;
}

}
