package com.booking.bookbed.services;

import java.util.ArrayList;
import java.util.List;

import com.booking.bookbed.entities.CopponRoom;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.modelviews.CopponRoomEntity;
import com.booking.bookbed.repositories.CopponRoomRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("copponRoomService")
public class CoppedRoomService implements ICopponRoomService {
    @Autowired
    private CopponRoomRepository copponRoomRepository;
    @Autowired
    private RoomService roomService;
    @Autowired
	private HotelService hotelService;

    @Override
    public CopponRoom save(CopponRoom copponRoom) {

        return copponRoomRepository.save(copponRoom);
    }

    @Override
    public boolean createCopponRoom(CopponRoomEntity  copponRoomEntity) {
        try {
            if (roomService.findById(copponRoomEntity.getId()).getCopponRoom() == null) {
                CopponRoom copponRoom = new CopponRoom();
              copponRoom.convertFromEntity(copponRoomEntity);
                CopponRoom copponRoomResult = save(copponRoom);
                Room room  = roomService.findById(copponRoomEntity.getId());
                room.setCopponRoom(copponRoomResult);
                roomService.save(room);
            } else {
                CopponRoom  copponRoom = roomService .findById(copponRoomEntity.getId()).getCopponRoom();
                copponRoom.convertFromEntity(copponRoomEntity);
               save(copponRoom);
            }
          
            
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<CopponRoomEntity> getCopponRoomEntitiesByIdRoom(int id) {
        List<CopponRoomEntity> copponRoomEntities = new ArrayList<CopponRoomEntity>();
        int hotelId = roomService.findById(id).getHotel().getId();
        for (Room room : hotelService.findById(hotelId).getRooms()) {
			CopponRoomEntity copponRoomEntity = new CopponRoomEntity();
			copponRoomEntity.setRoomName(room.getName());
			copponRoomEntity.setDiscountValue(room.getCopponRoom().getSale().toString());
			copponRoomEntity.setDiscountName(room.getCopponRoom().getName());
            copponRoomEntity.setStatus(room.getCopponRoom().isStatus());
            copponRoomEntity.setId(room.getId());
			copponRoomEntities.add(copponRoomEntity);
		}
        return copponRoomEntities;
    }

    @Override
    public void deleteById(int id) {
       

    }

    @Override
    public void deleteByObjectRoomEmpty(CopponRoom copponRoom) {
        // TODO Auto-generated method stub

    }

    @Override
    public Iterable<CopponRoom> findAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public CopponRoomEntity findByIdRoom(int id) {
        Room room = roomService.findById(id);
        CopponRoomEntity copponRoomEntity = new CopponRoomEntity();
        copponRoomEntity.setRoomName(room.getName());
        copponRoomEntity.setDiscountValue(room.getCopponRoom().getSale().toString());
        copponRoomEntity.setDiscountName(room.getCopponRoom().getName());
        copponRoomEntity.setStatus(room.getCopponRoom().isStatus());
        copponRoomEntity.setId(room.getId());
        return copponRoomEntity;
    }

    @Override
    public CopponRoom findById(int id) {
        
        return copponRoomRepository.findById(id).get();
    }

}
