package com.booking.bookbed.entities;
// Generated Nov 1, 2019 4:41:20 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 * ImageRoom generated by hbm2java
 */
@Entity
@Table(name = "image_room")
public class ImageRoom implements java.io.Serializable {

	private Integer id;
	@JsonIgnore
	private Room room;
	private String src;
	private String alt;
	private boolean status;

	public ImageRoom() {
	}

	public ImageRoom(Room room, boolean status) {
		this.room = room;
		this.status = status;
	}

	public ImageRoom(Room room, String src, String alt, boolean status) {
		this.room = room;
		this.src = src;
		this.alt = alt;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_id", nullable = false)
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Column(name = "src", length = 250)
	public String getSrc() {
		return this.src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	@Column(name = "alt", length = 250)
	public String getAlt() {
		return this.alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public ImageRoom(Integer id) {
		this.id = id;
	}

	public ImageRoom(Integer id, Room room, String src, String alt, boolean status) {
		this.id = id;
		this.room = room;
		this.src = src;
		this.alt = alt;
		this.status = status;
	}

}
