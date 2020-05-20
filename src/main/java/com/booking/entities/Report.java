package com.booking.entities;

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

/**
 * Report generated by hbm2java
 */
@Entity
@Table(name = "report")
public class Report implements java.io.Serializable {

	private Integer id;
	private Account account;
	private ReasonReport reasonReport;
	private Room room;
	private String content;
	private Date created;
	private boolean status;

	public Report() {
	}

	public Report(Account account, Room room, Date created, boolean status) {
		this.account = account;
		this.room = room;
		this.created = created;
		this.status = status;
	}

	public Report(Account account, ReasonReport reasonReport, Room room, String content, Date created, boolean status) {
		this.account = account;
		this.reasonReport = reasonReport;
		this.room = room;
		this.content = content;
		this.created = created;
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
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_reason")
	public ReasonReport getReasonReport() {
		return this.reasonReport;
	}

	public void setReasonReport(ReasonReport reasonReport) {
		this.reasonReport = reasonReport;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel_id", nullable = false)
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Column(name = "content", length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created", nullable = false, length = 10)
	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
