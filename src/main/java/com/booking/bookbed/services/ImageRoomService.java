package com.booking.bookbed.services;

import java.util.ArrayList;
import java.util.List;

import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.modelviews.ImageRoomEntity;
import com.booking.bookbed.repositories.ImageRoomRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("imageRoomService")
public class ImageRoomService implements IImageRoomService {
	@Autowired
	private ImageRoomRepository imageRoomRepository;
	@Autowired
	private RoomService roomService;

	@Override
	public List<ImageRoom> findByIdRoom(int id) {

		return imageRoomRepository.findByIdRoom(id);
	}

	// find image description list for room. Return List ImageRoomEntity
	@Override
	public List<ImageRoomEntity> findByIdRoomImageRoomEntity(int id) {
		// image room data
		List<ImageRoom> imageRooms = findByIdRoom(id);
		List<ImageRoomEntity> resultRooms = new ArrayList<ImageRoomEntity>();
		Room room = roomService.findById(id);
		ImageRoomEntity imageRoom = new ImageRoomEntity();
		imageRoom.setAlt(room.getName());
		imageRoom.setSrc(room.getSrcIcon());
		imageRoom.setType(true);
		resultRooms.add(imageRoom);
		for (ImageRoom item : imageRooms) {
			ImageRoomEntity imageRoomEntity = new ImageRoomEntity();
			imageRoomEntity.setId(item.getId());
			imageRoomEntity.setSrc(item.getSrc());
			imageRoomEntity.setAlt(item.getAlt());
			imageRoomEntity.setType(false);
			resultRooms.add(imageRoomEntity);
		}

		return resultRooms;
	}

	// save image description room
	@Override
	public ImageRoom save(ImageRoom imageRoom) {

		return imageRoomRepository.save(imageRoom);
	}

	// find image description room
	@Override
	public ImageRoom findById(int id) {

		return imageRoomRepository.findById(id).get();
	}

	// delete image description room
	@Override
	public void delete(ImageRoom imageRoom) {
		imageRoomRepository.delete(imageRoom);

	}

}
