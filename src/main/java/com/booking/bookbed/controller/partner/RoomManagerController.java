package com.booking.bookbed.controller.partner;

import java.util.List;

import javax.validation.Valid;

import com.booking.bookbed.entities.Account;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.entities.ImageRoom;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.exceptions.BadRequestException;
import com.booking.bookbed.helper.CheckHelper;
import com.booking.bookbed.helper.UploadFileHelper;
import com.booking.bookbed.services.AccountService;
import com.booking.bookbed.services.BedTypeService;
import com.booking.bookbed.services.HotelService;
import com.booking.bookbed.services.ImageRoomService;
import com.booking.bookbed.services.RoomCategoryService;
import com.booking.bookbed.services.RoomService;
import com.booking.bookbed.services.RoomTypeService;
import com.booking.bookbed.validations.RoomValidator;

import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("roomManager")
public class RoomManagerController {
    @Autowired
    private RoomValidator roomValidator;
    @Autowired
    private CheckHelper checkHelper;
    @Autowired
    private AccountService accountService;
    @Autowired
    private HotelService hotelService;
    @Autowired
    private BedTypeService bedTypeService;
    @Autowired
    private RoomCategoryService roomCategoryService;
    @Autowired
    private RoomTypeService roomTypeService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private UploadFileHelper uploadFileHelper;
    @Autowired
    private ImageRoomService imageRoomService;

    @RequestMapping(value = "create/{id}", method = RequestMethod.GET)
    public String create(ModelMap map, @PathVariable("id") int idHotel, Authentication authentication) {
        Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
        if (checkHelper.checkHotelofAccountSession(idHotel, account.getId())) {
          
            Room room = new Room();
            map.put("room", room);
            map.put("idHotel", idHotel);
            map.put("bedTypes", bedTypeService.findAll());
            map.put("roomCategories", roomCategoryService.findAll());
            map.put("account", account);
            map.put("roomTypes", roomTypeService.findAll());
            map.put("title", "Create");
        	if (checkHelper.checkRoleHotel(hotelService.find(idHotel))) {
				return  "roomManager.create";
			} else {
				throw new BadRequestException();
			
			}
		} else {
			throw new BadRequestException();
		}
    }
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(ModelMap map, @ModelAttribute("room") @Valid Room room, BindingResult bindingResult,
            @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes,Authentication authentication,
            @RequestParam("idHotel") int idHotel, @RequestParam("images[]") List<MultipartFile> files) {

        if (file.isEmpty()) {

            room.setSrcIcon("");
        } else {
            room.setSrcIcon("have");
        }
        roomValidator.validate(room, bindingResult);
        Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
        if (bindingResult.hasErrors()) {
          map.put("room", room);
            map.put("idHotel", idHotel);
            map.put("bedTypes", bedTypeService.findAll());
            map.put("roomCategories", roomCategoryService.findAll());
            map.put("roomTypes", roomTypeService.findAll());
            map.put("title", "Create");
            map.put("account",account);
            return "roomManager.create";
        } else {

            String fileNames = uploadFileHelper.saveFile(file, "rooms"); // save file
            room.setSrcIcon(fileNames);
            room.setHotel(new Hotel(idHotel));
            Room roomResult = roomService.save(room);
            if (roomResult != null) {

                if (files.size() > 0) {
                    int temp = 0;
                    for (MultipartFile multipartFile : files) {
                        String fileName = uploadFileHelper.saveFile(multipartFile, "rooms");
                        ImageRoom imageRoom = new ImageRoom();
                        imageRoom.setRoom(roomResult);
                        imageRoom.setSrc(fileName);
                        imageRoom.setAlt(roomResult.getName());
                        ImageRoom imageRoomResult = imageRoomService.save(imageRoom);
                        if (imageRoomResult != null) {
                            temp++;
                        }
                        if (temp > 20) {
                            break;
                        }

                    }
                    if (temp > 0) {
                        redirectAttributes.addFlashAttribute("ms", "ok");

                        return "redirect:/partnerManager/hotel/detail/" + idHotel;
                    } else {
                        redirectAttributes.addFlashAttribute("ms", "noImageDescription");

                        return "redirect:/partnerManager/hotel/detail/" + idHotel;
                    }

                } else {

                    redirectAttributes.addFlashAttribute("ms", "noImageDescription");

                    return "redirect:/partnerManager/hotel/detail/" + idHotel;
                }

            } else {
                redirectAttributes.addFlashAttribute("ms", "failed");
                map.put("room", room);
                map.put("idHotel", idHotel);
                map.put("bedTypes", bedTypeService.findAll());
                map.put("roomCategories", roomCategoryService.findAll());
                map.put("roomTypes", roomTypeService.findAll());
                map.put("account", account);
                map.put("title", "Create");
                return "roomManager.create";
            }
        }

    }

    @RequestMapping(value = "{id}/edit/{idRoom}", method = RequestMethod.GET)
    public String edit(ModelMap map, @PathVariable("idRoom") int idRoom, Authentication authentication) {
        Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
        if (checkHelper.checkRoomofAccountSession(idRoom, account.getId())) {
            map.put("room", roomService.findById(idRoom));
            map.put("bedTypes", bedTypeService.findAll());
            map.put("roomCategories", roomCategoryService.findAll());
            map.put("roomTypes", roomTypeService.findAll());
            map.put("account", account);
            map.put("title", "edit");
       	if (checkHelper.checkRoleHotel(roomService.findById(idRoom).getHotel())) {
				return  "roomManager.edit";
			} else {
				throw new BadRequestException();
			
			}
		} else {
			throw new BadRequestException();
		}
    }
    @RequestMapping(value = "{id}/edit/{idRoom}", method = RequestMethod.POST)
	public String edit(ModelMap map, @ModelAttribute("room") @Valid Room room, Errors bindingResult,
			@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes,Authentication authentication,
			 @RequestParam("images[]") List<MultipartFile> files) {
                Account account = accountService.findByUsernameAndStatus(authentication.getName(), true);
        roomValidator.validateCustom(room,files.size(),bindingResult);
       
		if (bindingResult.hasErrors()) {
           Room roomResult = roomService.findById(room.getId());
            room.setHotel(roomResult.getHotel());
            room.setImageRooms(roomResult.getImageRooms());
            map.put("room", room);
            map.put("bedTypes", bedTypeService.findAll());
            map.put("roomCategories", roomCategoryService.findAll());
            map.put("roomTypes", roomTypeService.findAll());
            map.put("account", account);
            map.put("title", "edit");
            return "roomManager.edit";
		} else {
			if (!file.isEmpty()) {
                String fileNames = uploadFileHelper.saveFile(file, "rooms"); // save file
                room.setSrcIcon(fileNames);
            }
            room.setHotel(roomService.findById(room.getId()).getHotel());
            Room roomResult = roomService.save(room);
            
			if (roomResult != null) {
          
				if (files.size() > 0) {
					int temp = 0;
					for (MultipartFile multipartFile : files) {
                        if (multipartFile.getSize() > 0){  
                        String fileName = uploadFileHelper.saveFile(multipartFile, "rooms");
                        ImageRoom imageRoom = new ImageRoom();
                        imageRoom.setRoom(roomResult);
                        imageRoom.setSrc(fileName);
                        imageRoom.setAlt(roomResult.getName());
                        ImageRoom imageRoomResult = imageRoomService.save(imageRoom);
						if (imageRoomResult != null) {
							temp++;
						}
						if (temp > 20) {
							break;
						}

					}}
					if (temp > 0) {
						redirectAttributes.addFlashAttribute("ms", "ok");

						return "redirect:/hotelManager/detail/" + roomResult.getHotel().getId();
					} else {
						redirectAttributes.addFlashAttribute("ms", "noImageDescription");

						return "redirect:/hotelManager/detail/" + roomResult.getHotel().getId();
					}

				} else {

					redirectAttributes.addFlashAttribute("ms", "noImageDescription");

					return "redirect:/hotelManager/detail/" + roomResult.getHotel().getId();
				}

			} else {
                map.put("room", room);
                map.put("bedTypes", bedTypeService.findAll());
                map.put("roomCategories", roomCategoryService.findAll());
                map.put("roomTypes", roomTypeService.findAll());
                map.put("account", account);
                map.put("title", "edit");
                return "roomManager.edit";
			}
		}

	}

}
