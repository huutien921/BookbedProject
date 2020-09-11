package com.booking.bookbed.controller.partner;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.modelviews.CopponRoomEntity;
import com.booking.bookbed.modelviews.ImageRoomEntity;
import com.booking.bookbed.services.CoppedRoomService;
import com.booking.bookbed.services.ImageRoomService;
import com.booking.bookbed.validations.CopponRoomEntityValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
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
	@Autowired 
	private CoppedRoomService copponRoomService;
	@Autowired
	private CopponRoomEntityValidator copponRoomEntityValidator;

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
	@RequestMapping(value = "discount/create" ,method = RequestMethod.POST, produces = { MediaType.APPLICATION_JSON_VALUE },consumes = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Object> saveDiscount(@RequestBody @Valid CopponRoomEntity copponRoomEntity , BindingResult bindingResult) {
		copponRoomEntityValidator.validate(copponRoomEntity, bindingResult);
			try {
				if (bindingResult.hasErrors()) {
					return new ResponseEntity<>(bindingResult.getAllErrors(), HttpStatus.BAD_REQUEST);
				}
				if (copponRoomService.createCopponRoom(copponRoomEntity)) {
					return new ResponseEntity<>( copponRoomService.getCopponRoomEntitiesByIdRoom(copponRoomEntity.getId()), HttpStatus.OK);
				
				} else {

					return new ResponseEntity<>( new ArrayList<CopponRoomEntity>(), HttpStatus.BAD_REQUEST);
				
				}
			} catch (Exception e) {

				return new ResponseEntity<>( new ArrayList<CopponRoomEntity>(), HttpStatus.BAD_REQUEST);
			}

		

	}
	@RequestMapping(value = "discount/find", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public CopponRoomEntity  discountfind(@RequestParam("idRoom") int idRoom) {

		return copponRoomService.findByIdRoom(idRoom);

	}

}