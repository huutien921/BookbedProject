package com.booking.bookbed.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.booking.bookbed.entities.Evaluate;
import com.booking.bookbed.entities.Hotel;
import com.booking.bookbed.modelviews.HotelEntity;
import com.booking.bookbed.entities.Room;
import com.booking.bookbed.modelviews.SearchInfo;
import com.booking.bookbed.repositories.HotelRepository;
import com.booking.bookbed.helper.CheckHelper;
import com.booking.bookbed.helper.CheckUrlHelper;
import com.booking.bookbed.helper.VNCharacterUtils;

@Service("hotelService")
public class HotelService implements IHotelService {
	@Autowired
	private HotelRepository hotelRepository;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ServiceHotelService serviceHotelService;
	@Autowired
	private CheckUrlHelper checkUrlHelper;
	@Autowired
	private CheckHelper checkHelper;

	@Override
	public List<Hotel> searchByAddressAddPriority(String address, Date checkIn, Date checkOut, int guests,
			int quanRoom) {
		List<Hotel> hotelResult = new ArrayList<Hotel>();
		List<Hotel> hotelResult2 = new ArrayList<Hotel>();

		for (Hotel hotel : hotelRepository.searchByAddress(address.toUpperCase(),
				stripAccents(address.toUpperCase()))) {
			for (Room room : hotel.getRooms()) {
				// truy van dieu kien khach san du phong cho khach hang
				if (room.isStatus() == true && room.getCapacity() >= guests && room.getAmountOfRoom() >= quanRoom) {
					// kiem tra da co trong danh sach dat hang chua,
					long soPhongConLai = room.getAmountOfRoom()
							- orderDetailService.sumQuantityByIdRoomAndDate(room.getId(), checkIn, checkOut);

					if (soPhongConLai >= quanRoom) {

						hotelResult.add(hotel);
						break;
					}

				}
			}
		}
		for (Hotel hotel : hotelResult) {
			if (checkHelper.checkHotelSearch(hotel)) {

				for (Room room : hotel.getRooms()) {
					if (checkUrlHelper.checkUrlBookingDate(room.getId(), checkIn, checkOut, quanRoom)) {
						hotelResult2.add(hotel);
						break;
					}
				}
			}
		}

		// sap xep theo do uu tien dich vu
		Collections.sort(hotelResult2, new Comparator<Hotel>() {

			@Override
			public int compare(Hotel o1, Hotel o2) {
				// TODO Auto-generated method stub
				return serviceHotelService.getPriorityMax(new Date(), o1.getId(), true) > serviceHotelService
						.getPriorityMax(new Date(), o2.getId(), true) ? -1 : 1;
			}
		});
		return hotelResult2;
	}

	@Override
	public List<HotelEntity> searchByAddressAddPriorityJson(String address, Date checkIn, Date checkOut, int guests,
			int room) {

		return convertToHotelEntity(searchByAddressAddPriority(address, checkIn, checkOut, guests, room));
	}

	public List<Hotel> getIndexRemovePrice(List<Hotel> hotels, double minPrice, double maxPrice) {

		List<Hotel> indexPrices = new ArrayList<>();
		for (Hotel hotel : hotels) {
			int quantity = 0;
			double tatolPrice = 0;
			double averagePrice;
			for (Room room : hotel.getRooms()) {

				if (room.isStatus() == true && room.getAmountOfRoom() > 0) {
					quantity = quantity + room.getAmountOfRoom();
					tatolPrice = tatolPrice + (room.getPrice() * room.getAmountOfRoom());
				}

			}
			if (hotel.getCopponHotel() != null && hotel.getCopponHotel().isStatus() == true) {
				averagePrice = (tatolPrice / quantity) * (100 - hotel.getCopponHotel().getSale()) / 100;
			} else {
				averagePrice = (tatolPrice / quantity);

			}

			if (minPrice > averagePrice || averagePrice > maxPrice) {
				indexPrices.add(hotel);
			}
		}

		return indexPrices;
	}

	public List<Hotel> getIndexRemoveStar(List<Hotel> hotels, Boolean amount1, Boolean amount2, Boolean amount3,
			Boolean amount4, Boolean amount5) {
		List<Hotel> indexStar = new ArrayList<>();
		// if amount1 == true add to list new
		if (amount1) {
			for (Hotel hotel : hotels) {
				if (hotel.getStarRating().getAmount() == 1) {
					indexStar.add(hotel);
				}
			}

		}
		if (amount2) {
			for (Hotel hotel : hotels) {
				if (hotel.getStarRating().getAmount() == 2) {
					indexStar.add(hotel);
				}
			}
		}
		if (amount3) {
			for (Hotel hotel : hotels) {
				if (hotel.getStarRating().getAmount() == 3) {
					indexStar.add(hotel);
				}
			}
		}
		if (amount4) {
			for (Hotel hotel : hotels) {
				if (hotel.getStarRating().getAmount() == 4) {
					indexStar.add(hotel);
				}
			}
		}
		if (amount5) {
			for (Hotel hotel : hotels) {
				if (hotel.getStarRating().getAmount() == 5) {
					indexStar.add(hotel);

				}
			}
		}
		if (!amount5 && !amount4 && !amount3 && !amount1 && !amount2) {
			for (Hotel hotel : hotels) {
				indexStar.add(hotel);

			}
		}

		return indexStar;
	}

	// filter bed type
	public List<Hotel> getIndexRemoveBed(List<Hotel> hotels, Boolean singleBed, Boolean doubleBed, Boolean teamBed) {
		List<Hotel> indexStar = new ArrayList<>();
		if (doubleBed) {
			for (Hotel hotel : hotels) {
				for (Room room : hotel.getRooms()) {
					if (room.getBedType().getName().equalsIgnoreCase("double")) {
						indexStar.add(hotel);
						break;
					}
				}
			}
		}
		if (singleBed) {
			for (Hotel hotel : hotels) {
				for (Room room : hotel.getRooms()) {
					if (room.getBedType().getName().equalsIgnoreCase("single")) {
						indexStar.add(hotel);
						break;
					}
				}
			}
		}
		if (teamBed) {
			for (Hotel hotel : hotels) {
				for (Room room : hotel.getRooms()) {
					if (room.getBedType().getName().equalsIgnoreCase("team")) {
						indexStar.add(hotel);
						break;
					}
				}
			}
		}

		return indexStar;
	}

	// filter facilities if has facility will add to new list 
	public List<Hotel> getIndexRemoveFacilites(List<Hotel> hotels, Boolean wifi, Boolean parking, Boolean spa, Boolean gym,
	Boolean carRental, Boolean airportTransfer, Boolean freeBreakfast, Boolean swimmingPool, Boolean payAtHotel,
	Boolean assemblyFacility, Boolean driveway, Boolean elevator, Boolean airConditioner, Boolean receptionist, Boolean freeCancellation) {
	
		List<Hotel> indexFacility = new ArrayList<>();
		//create a array property to complete with each hotel
		Boolean[] propertyComplete = {wifi,parking,spa,gym,carRental,airportTransfer,freeBreakfast,swimmingPool,payAtHotel,assemblyFacility,driveway,elevator,airConditioner,receptionist,freeCancellation};
		//get property is true
		List<Integer> propertyCompleteIndex = new ArrayList<>();
	
		for(int i = 0; i < propertyComplete.length; i++ ){
		if(propertyComplete[i]){
		propertyCompleteIndex.add(i);
		}
			}
			
			for (Hotel hotel : hotels) {
				boolean result = true;
				for(Integer integer : propertyCompleteIndex){
							if(integer == 0){
								if (!hotel.getWifi()) {
									result = false;
									break;
								}
							}
							if(integer == 1){
								if (!hotel.getParking()){
									result = false;
									break;
								}
							}
							if(integer == 2){
								if (!hotel.getSpa()) {
									result = false;
									break;
								}
							}
							if(integer == 3){
								if (!hotel.getGym()){
									result = false;
									break;
								}

							}
							if(integer == 4){
								if (!hotel.getCarRental()) {
									result = false;
									break;
								}

							}
							if(integer == 5){
								if (!hotel.getAirportTransfer()) {
									result = false;
									break;
								}}

								if(integer== 6){
									if (!hotel.getFreeBreakfast()) {
										result = false;
										break;
									}
	
								}
								if(integer== 7){
									if (!hotel.getSwimmingPool()) {
										result = false;
										break;
									}
	
								}
								if(integer== 8){
									if (!hotel.getPayAtHotel()) {
										result = false;
										break;
									}
	
								}
								if(integer== 9){
									if (!hotel.getAssemblyFacilites()) {
										result = false;
										break;
									}
								}
								if(integer == 10 ){
									if (!hotel.getDriveway()) {
										result = false;
										break;
									}
								}
								if(integer == 11 ){
									if (!hotel.getElevator()) {

										result = false;
										break;
									}
								}
								if(integer == 12 ){
									if (!hotel.getAirConditioner()) {
										result = false;
										break;
									}
								}
								if(integer == 13 ){
									if (!hotel.getReceptionist()) {
										result = false;
										break;
									}
								}
								if(integer == 14 ){
									if (!hotel.getFreeCancellation()) {
										result = false;
										break;
									}
								}

							
							

				}
				if(result){indexFacility.add(hotel);}

				
			}
		return indexFacility;
	}

	@Override
	public Hotel findById(int id) {

		return hotelRepository.findById(id).get();
	}

	public List<Hotel> searchHotelByStatusFalseAndIdAccountEmployeeNull() {
		return hotelRepository.searchHotelByStatusFalseAndIdAccountEmployeeNull();
	}

	@Override
	public Hotel FindHotelByStatusFalseAndIdAccountEmployeeNullById(int id) {
		return hotelRepository.FindHotelByStatusFalseAndIdAccountEmployeeNullById(id);
	}

	@Override
	public Iterable<Hotel> searchHotelByStatusAndIdAccountEmployee(boolean status) {
		return hotelRepository.searchHotelByStatusAndIdAccountEmployee(status);
	}

	@Override
	public Hotel find(int id) {
		return hotelRepository.findById(id).get();
	}

	@Override
	public Iterable<Hotel> filterHotelForEmployee(boolean status, String name, int starRating, String country,
			String city, String provincial) {
		return hotelRepository.filterHotelForEmployee(status, name, starRating, country, city, provincial);
	}

	@Override
	public List<HotelEntity> searchByAddressAddPriorityAddPriceJsonObject(String address, Date checkIn, Date checkOut,
			int guests, int room, double minPrice, double maxPrice) {

		return convertToHotelEntity(
				searchByAddressAddPriorityAddPrice(address, checkIn, checkOut, guests, room, minPrice, maxPrice));
	}

	// search rest api with searchInfo
	@Override
	public List<HotelEntity> searchByAddressAddPriorityAddStarJsonObject(SearchInfo searchInfo) {
		List<HotelEntity> entities = convertToHotelEntity(searchByAddressAddPriorityAddStar(searchInfo));
		switch (searchInfo.getSort()) {
			case "short":
			Collections.sort(entities, new Comparator<HotelEntity>() {

				@Override
				public int compare(HotelEntity o1, HotelEntity o2) {
					double price1 = o1.getPrice();
					double price2 = o2.getPrice();
					if (o1.getPriceCoppon() != null) {
						price1 = o1.getPriceCoppon();
					} 
					if (o2.getPriceCoppon() != null) {
						price2 = o2.getPriceCoppon();
					}
					return price1 < price2 ? -1 : 1;
				}
			});
			break ;
			case "high":
			Collections.sort(entities, new Comparator<HotelEntity>() {

				@Override
				public int compare(HotelEntity o1, HotelEntity o2) {
					// TODO Auto-generated method stub
					return o1.getPrice() > o2.getPrice() ? -1 : 1;
				}
			});
			break ;
			case "common":
			Collections.sort(entities, new Comparator<HotelEntity>() {

				@Override
				public int compare(HotelEntity o1, HotelEntity o2) {
					// TODO Auto-generated method stub
					return o1.getComment() > o2.getComment() ? -1 : 1;
				}
			});
			break ;
			case "evaluateHigh":
			Collections.sort(entities, new Comparator<HotelEntity>() {

				@Override
				public int compare(HotelEntity o1, HotelEntity o2) {
					// TODO Auto-generated method stub
				
					return o1.isPrestige() ? -1 : 1;
				}
			});
			break ;
		
			default:
				break;
		}
		return entities;
	}

	private List<HotelEntity> convertToHotelEntity(List<Hotel> hotels) {

		List<HotelEntity> hotelEntities = new ArrayList<>();
		for (Hotel hotel : hotels) {
			HotelEntity hotelEntity = new HotelEntity();
			hotelEntity.setId(hotel.getId());
			hotelEntity.setName(hotel.getName());
			hotelEntity.setStarRatingNum(hotel.getStarRating().getAmount());
			hotelEntity.setImage(hotel.getImage());
			hotelEntity.setWard(hotel.getWard());
			hotelEntity.setCity(hotel.getCity());
			hotelEntity.setPriceCoppon(getPriceHotelCoppon(hotel));
			hotelEntity.setPrice(getAvragePriceHotel(hotel));
			hotelEntity.setPrestige(checkPrestige(hotel));
			hotelEntity.setComment(getQuantityCommentHotel(hotel));
			hotelEntities.add(hotelEntity);
		}

		return hotelEntities;

	}

	// search filter with search info object and with api , ajax
	public List<Hotel> searchByAddressAddPriorityAddStar(SearchInfo searchInfo) {

		try {
			Date checkInDate = new SimpleDateFormat("MM/dd/yyyy").parse(searchInfo.getCheckInDate());
			Date checkOutDate = new SimpleDateFormat("MM/dd/yyyy").parse(searchInfo.getCheckOutDate());

			// list hotel current
			List<Hotel> current = searchByAddressAddPriority(searchInfo.getAddress(), checkInDate, checkOutDate,
					Integer.parseInt(searchInfo.getGuests()), Integer.parseInt(searchInfo.getRooms()));
			// list hotel after filter by price
			List<Hotel> indexsObj = getIndexRemovePrice(current, Double.parseDouble(searchInfo.getPriceMin()),
					Double.parseDouble(searchInfo.getPriceMax()));
			current.removeAll(indexsObj);
			// filter star in list current
			if (searchInfo.getStar1() || searchInfo.getStar2() || searchInfo.getStar3() || searchInfo.getStar4()
					|| searchInfo.getStar5()) {
				current = getIndexRemoveStar(current, searchInfo.getStar1(), searchInfo.getStar2(),
						searchInfo.getStar3(), searchInfo.getStar4(), searchInfo.getStar5());
			}
			// filter facilities
			if (searchInfo.getWifi() || searchInfo.getParking() || searchInfo.getSpa() || searchInfo.getGym()
					|| searchInfo.getCarRental() || searchInfo.getAirportTransfer() || searchInfo.getFreeBreakfast()
					|| searchInfo.getSwimmingPool() || searchInfo.getPayAtHotel() | searchInfo.getAssemblyFacilites()
					|| searchInfo.getDriveway()||searchInfo.getElevator()||searchInfo.getAirConditioner()||searchInfo.getReceptionist()||searchInfo.getFreeCancellation()) {
				current = getIndexRemoveFacilites(current, searchInfo.getWifi(), searchInfo.getParking(),
						searchInfo.getSpa(), searchInfo.getGym(), searchInfo.getCarRental(),
						searchInfo.getAirportTransfer(), searchInfo.getFreeBreakfast(), searchInfo.getSwimmingPool(),
						searchInfo.getPayAtHotel(), searchInfo.getAssemblyFacilites(), searchInfo.getDriveway(),searchInfo.getElevator(),searchInfo.getAirConditioner()
						,searchInfo.getReceptionist(),searchInfo.getFreeCancellation());
				

			}
			// filter Bed Type
			if (searchInfo.getSingleBed() || searchInfo.getDoubleBed() || searchInfo.getTeamBed()) {
				current = getIndexRemoveBed(current, searchInfo.getSingleBed(), searchInfo.getDoubleBed(),
						searchInfo.getTeamBed());

			}
	
			return current;
		} catch (Exception e) {
			return null;
		}
	}

	// search with price
	public List<Hotel> searchByAddressAddPriorityAddPrice(String address, Date checkIn, Date checkOut, int guests,
			int rooms, double minPrice, double maxPrice) {
		List<Hotel> hotels = searchByAddressAddPriority(address, checkIn, checkOut, guests, rooms);
		List<Hotel> indexsObj = getIndexRemovePrice(hotels, minPrice, maxPrice);
		if (indexsObj != null) {
			for (Hotel hotel : indexsObj) {
				hotels.remove(hotel);
			}
		}

		return hotels;
	}

	private Double getAvragePriceHotel(Hotel hotel) {

		double priceTatol = 0;
		int roomQuantity = 0;
		for (Room roomPrice : hotel.getRooms()) {
			if (roomPrice.getAmountOfRoom() > 0 && roomPrice.isStatus() == true) {
				priceTatol = priceTatol + (roomPrice.getAmountOfRoom() * roomPrice.getPrice());
				roomQuantity = roomQuantity + roomPrice.getAmountOfRoom();
			}

		}
		return priceTatol / roomQuantity;

	}

	private Double getPriceHotelCoppon(Hotel hotel) {

		Double priceAverage = getAvragePriceHotel(hotel);
		if (hotel.getCopponHotel() != null && hotel.getCopponHotel().isStatus() == true) {
			return (priceAverage * (100 - hotel.getCopponHotel().getSale()) / 100);
		} else {
			return null;

		}

	}

	private int getQuantityCommentHotel(Hotel hotel) {

		return hotel.getEvaluates().size();
	}

	private boolean checkPrestige(Hotel hotel) {
		boolean result = false;
		int numStar = 0;
		try {
			if (hotel.getEvaluates() != null) {
				for (Evaluate evaluate : hotel.getEvaluates()) {
					numStar = numStar + evaluate.getNumberOfStars();
				}
				if ((numStar / getQuantityCommentHotel(hotel)) > 3.5) {
					result = true;
				}
			}
		} catch (Exception e) {
			result = false;
		}

		return result;
	}

	@Override
	public List<Hotel> relatedHotelLimitAddPriority(String address, Date checkIn, Date checkOut, int guests, int room,
			int n, Hotel hotel1) {
		List<Hotel> hotelsSearchByAddressAddPriority = searchByAddressAddPriority(address, checkIn, checkOut, guests,
				room);
		hotelsSearchByAddressAddPriority.remove(hotel1);

		List<Hotel> hotels = new ArrayList<>();
		for (Hotel hotel : hotelsSearchByAddressAddPriority) {
			hotels.add(hotel);
			if (hotels.size() == 3) {
				break;
			}
		}

		return hotels;
	}

	@Override
	public List<Hotel> findByAccountId(int id) {

		return hotelRepository.findByAccountId(id);
	}

	@Override
	public Hotel save(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelRepository.save(hotel);
	}

	// xoa dau phu
	public static String stripAccents(String s) {

		return VNCharacterUtils.removeAccent(s);
	}

	@Override
	public List<String> searchComplete(String address) {
		List<String> result = hotelRepository.searchCityComplete(address.toUpperCase(),
				stripAccents(address.toLowerCase()));
		result.addAll(hotelRepository.searchProvinComplete(address.toUpperCase(), stripAccents(address.toLowerCase())));
		return result;
	}

	@Override
	public List<Hotel> findByUsername(String username) {
		return hotelRepository.findByUsername(username);
	}

}
