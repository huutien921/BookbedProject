package com.booking.bookbed.modelviews;

import com.booking.bookbed.entities.CopponRoom;

public class CopponRoomEntity {
	private Integer id ;
	private String roomName;
	private String discountName;
	private String discountValue;
	private Boolean status;

	public CopponRoomEntity(Integer id, String roomName, String discountName, String discountValue, Boolean status) {
		this.id = id;
		this.roomName = roomName;
		this.discountName = discountName;
		this.discountValue = discountValue;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getDiscountName() {
		return discountName;
	}

	public void setDiscountName(String discountName) {
		this.discountName = discountName;
	}

	public String getDiscountValue() {
		return discountValue;
	}

	public void setDiscountValue(String discountValue) {
		this.discountValue = discountValue;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public CopponRoomEntity() {
	}


	
}
