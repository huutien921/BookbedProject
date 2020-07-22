package com.booking.bookbed.entities;

import java.util.List;

public class RoomEntity {
    private String id;
    private String name;
    private String price;
    private String sale;
    private String priceCoppon;
    private String image;
    private List<String> images;
    private String amountOfBed;
    private String capacity;
    private String amountOfRoom;
    private String roomType;
    private String roomCategory;
    private String bedType;
    private Boolean status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSale() {
        return sale;
    }

    public void setSale(String sale) {
        this.sale = sale;
    }

    public String getPriceCoppon() {
        return priceCoppon;
    }

    public void setPriceCoppon(String priceCoppon) {
        this.priceCoppon = priceCoppon;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public String getAmountOfBed() {
        return amountOfBed;
    }

    public void setAmountOfBed(String amountOfBed) {
        this.amountOfBed = amountOfBed;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getAmountOfRoom() {
        return amountOfRoom;
    }

    public void setAmountOfRoom(String amountOfRoom) {
        this.amountOfRoom = amountOfRoom;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getBedType() {
        return bedType;
    }

    public void setBedType(String bedType) {
        this.bedType = bedType;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

	public String getRoomCategory() {
		return roomCategory;
	}

	public void setRoomCategory(String roomCategory) {
		this.roomCategory = roomCategory;
	}


}
