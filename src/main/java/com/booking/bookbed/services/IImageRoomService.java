package com.booking.bookbed.services;

import java.util.List;

import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.modelviews.ImageRoomEntity;

public interface IImageRoomService {
	public List<ImageRoom> findByIdRoom( int id);
	public List<ImageRoomEntity> findByIdRoomImageRoomEntity(int id);
	public ImageRoom save(ImageRoom roomService);
	public ImageRoom findById(int id);
	public void delete(ImageRoom imageRoom);
}
