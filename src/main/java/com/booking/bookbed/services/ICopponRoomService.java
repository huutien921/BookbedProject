package com.booking.bookbed.services;

import java.util.List;

import com.booking.bookbed.entities.CopponRoom;
import com.booking.bookbed.modelviews.CopponRoomEntity;

public interface ICopponRoomService {
	public CopponRoom save(CopponRoom copponRoom);
	public boolean createCopponRoom(CopponRoomEntity copponRoomEntity);
	public List<CopponRoomEntity> getCopponRoomEntitiesByIdRoom(int id);
	public void deleteById(int id);
	public void deleteByObjectRoomEmpty(CopponRoom copponRoom);
    public Iterable<CopponRoom> findAll();
	public CopponRoomEntity findByIdRoom(int id);
	public CopponRoom findById(int id);
}
