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
 * TypePart generated by hbm2java
 */
@Entity
@Table(name = "type_part", catalog = "bookinghotel")
public class TypePart implements java.io.Serializable {

	private Integer id;
	private String name;
	private String description;
	private boolean status;
	private Set<Partners> partnerses = new HashSet<Partners>(0);

	public TypePart() {
	}

	public TypePart(String name, boolean status) {
		this.name = name;
		this.status = status;
	}

	public TypePart(String name, String description, boolean status, Set<Partners> partnerses) {
		this.name = name;
		this.description = description;
		this.status = status;
		this.partnerses = partnerses;
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

	@Column(name = "description", length = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "typePart")
	public Set<Partners> getPartnerses() {
		return this.partnerses;
	}

	public void setPartnerses(Set<Partners> partnerses) {
		this.partnerses = partnerses;
	}

}
