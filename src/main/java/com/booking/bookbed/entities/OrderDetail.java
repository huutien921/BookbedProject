package com.booking.bookbed.entities;
// Generated Nov 1, 2019 4:41:20 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 * OrderDetail generated by hbm2java
 */
@Entity
@Table(name = "order_detail")
public class OrderDetail implements java.io.Serializable {

	private Integer id;
	@JsonManagedReference
	private Orders orders;
	private Room room;
	private Date checkInDate;
	private Date checkOutDate;
	private Integer quantity;
	private String namestaying;
	private String email;
	private String note;
	private boolean status;

	public OrderDetail() {
	}

	public OrderDetail(Orders orders, Room room, Date checkInDate, Date checkOutDate, boolean status) {
		this.orders = orders;
		this.room = room;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.status = status;
	}





	public OrderDetail(Integer id, Orders orders, Room room, Date checkInDate, Date checkOutDate, Integer quantity,
			String namestaying, String email, String note, boolean status) {
		super();
		this.id = id;
		this.orders = orders;
		this.room = room;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.quantity = quantity;
		this.namestaying = namestaying;
		this.email = email;
		this.note = note;
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
	@JoinColumn(name = "order_id", nullable = false)
	public Orders getOrders() {
		return this.orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "room_id", nullable = false)
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "check_in_date", nullable = false, length = 10)
	public Date getCheckInDate() {
		return this.checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	
	@Column(name = "quantity")
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	@Column(name = "namestaying", length = 250)
	public String getNamestaying() {
		return namestaying;
	}

	public void setNamestaying(String namestaying) {
		this.namestaying = namestaying;
	}
	@Column(name = "email", length = 250)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "check_out_date", nullable = false, length = 10)
	public Date getCheckOutDate() {
		return this.checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	@Column(name = "note", length = 65535)
	public String getNote() {
		return this.note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}