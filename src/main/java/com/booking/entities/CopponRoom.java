package com.booking.entities;
// Generated Nov 1, 2019 4:41:20 PM by Hibernate Tools 5.1.10.Final

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CopponRoom generated by hbm2java
 */
@Entity
@Table(name = "coppon_room")
public class CopponRoom implements java.io.Serializable {

	private Integer id;
	private String name;
	private Double sale;
	private boolean status;
	private List<Room> rooms = new ArrayList<Room>();

	public CopponRoom() {
	}

	public CopponRoom(String name, boolean status) {
		this.name = name;
		this.status = status;
	}

	public CopponRoom(Integer id) {
		super();
		this.id = id;
	}

	public CopponRoom(String name, Double sale, boolean status, List<Room> rooms) {
		this.name = name;
		this.sale = sale;
		this.status = status;
		this.rooms = rooms;
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

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "sale", precision = 22, scale = 0)
	public Double getSale() {
		return this.sale;
	}

	public void setSale(Double sale) {
		this.sale = sale;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "copponRoom")
	public List<Room> getRooms() {
		return this.rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

}
