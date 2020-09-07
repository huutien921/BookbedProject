package com.booking.bookbed.controller.partner;

import java.util.ArrayList;
import java.util.List;

import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.modelviews.ImageRoomEntity;
import com.booking.bookbed.services.ImageRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/roomManager")
public class RoomManagerRestController {
	@Autowired
	private ImageRoomService imageRoomService;
	@Autowired
	private UploadFileHelper  fileHelper;

	@RequestMapping(value = "images", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ImageRoomEntity> findImageRoom(@RequestParam("id") int id) {

		return imageRoomService.findByIdRoomImageRoomEntity(id);

	}

	@RequestMapping(value = "delete/image",method = RequestMethod.GET, produces = { MediaType.APPLICATION_JSON_VALUE },consumes = { MediaType.APPLICATION_JSON_VALUE })

	public ResponseEntity<Object> deleteImageRoom(@RequestParam("id") int id) {
		ImageRoom imageRoom = imageRoomService.findById(id);
		int idRoom = imageRoom.getRoom().getId();
		try {
			
			imageRoomService.delete(new ImageRoom(id));
			fileHelper.deleteFile(imageRoom.getSrc());
			return new ResponseEntity<>( imageRoomService.findByIdRoomImageRoomEntity(idRoom), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(imageRoomService.findByIdRoomImageRoomEntity(idRoom), HttpStatus.BAD_REQUEST);
		}

	}

}