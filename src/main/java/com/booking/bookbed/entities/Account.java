package com.booking.bookbed.entities;
// Generated Nov 1, 2019 4:41:20 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;


/**
 * Account generated by hbm2java
 */
@Entity
@Table(name = "account", uniqueConstraints = @UniqueConstraint(columnNames = "username"))
public class Account implements java.io.Serializable {
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private Date birthday;
	private String email;
	private String address;
	private String type;
	private String gender;
	private String avatar;
	private String identitycard;
	private Integer score;
	private Boolean status;
	private Date created;
	private Date updated;
	private Double point;
	private Set<CreditCard> creditCards = new HashSet<CreditCard>(0);
	private Set<Service> services = new HashSet<Service>(0);
	private Set<Orders> orderses = new HashSet<Orders>(0);
	private Set<InvoiceCard> invoiceCards = new HashSet<InvoiceCard>(0);
	private Set<RoleAccount> roleAccounts = new HashSet<RoleAccount>(0);
	private Set<VerificationToken> verificationTokens = new HashSet<VerificationToken>(0);
	private Set<Evaluate> evaluates = new HashSet<Evaluate>(0);
	private Set<Blog> blogs = new HashSet<Blog>(0);
	private Set<Hotel> hotelsForIdAcEmployee = new HashSet<Hotel>(0);
	private Set<Report> reports = new HashSet<Report>(0);
	private Set<Panel> panels = new HashSet<Panel>(0);
	private Set<Hotel> hotelsForAccountId = new HashSet<Hotel>(0);
	private Set<Email> emails = new HashSet<Email>(0);
	private Set<Sale> sales = new HashSet<Sale>(0);

	public Account() {
	}

	public Account(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Account(String username, String password, String fullname, Date birthday, String email, String address,
			String type, String gender, String avatar, String identitycard, Integer score, Boolean status, Date created,
			Date updated, Double point, Set<CreditCard> creditCards, Set<Service> services, Set<Orders> orderses,
			Set<InvoiceCard> invoiceCards, Set<RoleAccount> roleAccounts, Set<VerificationToken> verificationTokens,
			Set<Evaluate> evaluates, Set<Blog> blogs, Set<Hotel> hotelsForIdAcEmployee, Set<Report> reports,
			Set<Panel> panels, Set<Hotel> hotelsForAccountId, Set<Email> emails, Set<Sale> sales) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
		this.type = type;
		this.gender = gender;
		this.avatar = avatar;
		this.identitycard = identitycard;
		this.score = score;
		this.status = status;
		this.created = created;
		this.updated = updated;
		this.point = point;
		this.creditCards = creditCards;
		this.services = services;
		this.orderses = orderses;
		this.invoiceCards = invoiceCards;
		this.roleAccounts = roleAccounts;
		this.verificationTokens = verificationTokens;
		this.evaluates = evaluates;
		this.blogs = blogs;
		this.hotelsForIdAcEmployee = hotelsForIdAcEmployee;
		this.reports = reports;
		this.panels = panels;
		this.hotelsForAccountId = hotelsForAccountId;
		this.emails = emails;
		this.sales = sales;
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

	@Column(name = "username", unique = true, nullable = false, length = 250)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 250)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "fullname", length = 250)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday", length = 10)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Column(name = "email", length = 250)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address", length = 500)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "type", length = 250)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "gender", length = 20)
	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "avatar", length = 250)
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "identitycard", length = 25)
	public String getIdentitycard() {
		return this.identitycard;
	}

	public void setIdentitycard(String identitycard) {
		this.identitycard = identitycard;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "status")
	public Boolean getStatus() {
		return this.status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created", length = 10)
	public Date getCreated() {
		return this.created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "updated", length = 10)
	public Date getUpdated() {
		return this.updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	@Column(name = "point", precision = 22, scale = 0)
	public Double getPoint() {
		return this.point;
	}

	public void setPoint(Double point) {
		this.point = point;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<CreditCard> getCreditCards() {
		return this.creditCards;
	}

	public void setCreditCards(Set<CreditCard> creditCards) {
		this.creditCards = creditCards;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Service> getServices() {
		return this.services;
	}

	public void setServices(Set<Service> services) {
		this.services = services;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<InvoiceCard> getInvoiceCards() {
		return this.invoiceCards;
	}

	public void setInvoiceCards(Set<InvoiceCard> invoiceCards) {
		this.invoiceCards = invoiceCards;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<RoleAccount> getRoleAccounts() {
		return this.roleAccounts;
	}

	public void setRoleAccounts(Set<RoleAccount> roleAccounts) {
		this.roleAccounts = roleAccounts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<VerificationToken> getVerificationTokens() {
		return this.verificationTokens;
	}

	public void setVerificationTokens(Set<VerificationToken> verificationTokens) {
		this.verificationTokens = verificationTokens;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Evaluate> getEvaluates() {
		return this.evaluates;
	}

	public void setEvaluates(Set<Evaluate> evaluates) {
		this.evaluates = evaluates;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Blog> getBlogs() {
		return this.blogs;
	}

	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "accountByIdAcEmployee")
	public Set<Hotel> getHotelsForIdAcEmployee() {
		return this.hotelsForIdAcEmployee;
	}

	public void setHotelsForIdAcEmployee(Set<Hotel> hotelsForIdAcEmployee) {
		this.hotelsForIdAcEmployee = hotelsForIdAcEmployee;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Report> getReports() {
		return this.reports;
	}

	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Panel> getPanels() {
		return this.panels;
	}

	public void setPanels(Set<Panel> panels) {
		this.panels = panels;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "accountByAccountId")
	public Set<Hotel> getHotelsForAccountId() {
		return this.hotelsForAccountId;
	}

	public void setHotelsForAccountId(Set<Hotel> hotelsForAccountId) {
		this.hotelsForAccountId = hotelsForAccountId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Email> getEmails() {
		return this.emails;
	}

	public void setEmails(Set<Email> emails) {
		this.emails = emails;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Sale> getSales() {
		return this.sales;
	}

	public void setSales(Set<Sale> sales) {
		this.sales = sales;
	}

}
