package com.booking.bookbed.modelviews;

public class CopponHotelEntity {
	private Integer id;
	private String discountName;
	private String discountValue;
	private Boolean status;

	public CopponHotelEntity(Integer id, String discountName, String discountValue, Boolean status) {
		this.id = id;
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

}
