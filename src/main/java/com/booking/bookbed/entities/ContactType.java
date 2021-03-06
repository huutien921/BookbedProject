package com.booking.bookbed.entities;

import java.util.HashSet;
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
 * ContactType generated by hbm2java
 */
@Entity
@Table(name = "contact_type", catalog = "bookinghotel")
public class ContactType implements java.io.Serializable {

	private Integer id;
	private String name;
	private boolean status;
	private Set<Contact> contacts = new HashSet<Contact>(0);

	public ContactType() {
	}

	public ContactType(String name, boolean status) {
		this.name = name;
		this.status = status;
	}

	public ContactType(String name, boolean status, Set<Contact> contacts) {
		this.name = name;
		this.status = status;
		this.contacts = contacts;
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

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "contactType")
	public Set<Contact> getContacts() {
		return this.contacts;
	}

	public void setContacts(Set<Contact> contacts) {
		this.contacts = contacts;
	}

}
