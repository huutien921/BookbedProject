package com.booking.bookbed.entities;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "about")
public class About implements java.io.Serializable {
	
	private Integer id;
	private String address;
	private String country;
	private String email;
	private String phone;
	private String name;
	private String facebook;
	private String youtube;
	private String instagram;
	private String twitter;
	private String android;
	private String ios;
	private String image;
	private boolean status;

	public About() {
	}

	public About(String address, String country, String email, String phone, String name, boolean status) {
		this.address = address;
		this.country = country;
		this.email = email;
		this.phone = phone;
		this.name = name;
		this.status = status;
	}

	public About(String address, String country, String email, String phone, String name, String facebook,
			String youtube, String instagram, String twitter, String android, String ios, String image,
			boolean status) {
		this.address = address;
		this.country = country;
		this.email = email;
		this.phone = phone;
		this.name = name;
		this.facebook = facebook;
		this.youtube = youtube;
		this.instagram = instagram;
		this.twitter = twitter;
		this.android = android;
		this.ios = ios;
		this.image = image;
		this.status = status;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "address", nullable = false, length = 250)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "country", nullable = false, length = 250)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "email", nullable = false, length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "phone", nullable = false, length = 50)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "facebook", length = 75)
	public String getFacebook() {
		return this.facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	@Column(name = "youtube", length = 75)
	public String getYoutube() {
		return this.youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	@Column(name = "instagram", length = 75)
	public String getInstagram() {
		return this.instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	@Column(name = "twitter", length = 75)
	public String getTwitter() {
		return this.twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	@Column(name = "android", length = 75)
	public String getAndroid() {
		return this.android;
	}

	public void setAndroid(String android) {
		this.android = android;
	}

	@Column(name = "ios", length = 75)
	public String getIos() {
		return this.ios;
	}

	public void setIos(String ios) {
		this.ios = ios;
	}

	@Column(name = "image", length = 40)
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
