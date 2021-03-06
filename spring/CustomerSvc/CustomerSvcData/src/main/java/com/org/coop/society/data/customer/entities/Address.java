package com.org.coop.society.data.customer.entities;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Where;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.annotation.LastModifiedDate;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the address database table.
 * 
 */
@Entity
@NamedQuery(name="Address.findAll", query="SELECT a FROM Address a")
@Where(clause="end_date is null")
public class Address implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="address_id")
	private int addressId;

	@Column(name="address_line1")
	private String addressLine1;

	@Column(name="address_line2")
	private String addressLine2;

	@Column(name="address_line3")
	private String addressLine3;

	@Column(name="address_name")
	private String addressName;

	@Column(name="address_type")
	private String addressType;

	@Column(name="create_date", updatable=false)
	private Timestamp createDate;

	@Column(name="create_user")
	private String createUser;

	@Column(name="email_id1")
	private String emailId1;

	@Column(name="email_id2")
	private String emailId2;

	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	private Date endDate;

	@Column(name="phone_no1")
	private String phoneNo1;

	@Column(name="phone_no2")
	private String phoneNo2;

	private String pin;

	@Temporal(TemporalType.DATE)
	@Column(name="start_date")
	private Date startDate;

	@Column(name="update_date", insertable=false, updatable=false)
	private Timestamp updateDate;

	@Column(name="update_user")
	private String updateUser;

	private String website;

	//bi-directional many-to-one association to DistrictMaster
	@ManyToOne
	@JoinColumn(name="dist_id")
	private DistrictMaster districtMaster;

	//bi-directional many-to-one association to BranchAddress
	@OneToMany(mappedBy="address", cascade=CascadeType.ALL)
	private List<BranchAddress> branchAddresses;

	public Address() {
	}

	public int getAddressId() {
		return this.addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return this.addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return this.addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getAddressName() {
		return this.addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public String getAddressType() {
		return this.addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return this.createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getEmailId1() {
		return this.emailId1;
	}

	public void setEmailId1(String emailId1) {
		this.emailId1 = emailId1;
	}

	public String getEmailId2() {
		return this.emailId2;
	}

	public void setEmailId2(String emailId2) {
		this.emailId2 = emailId2;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPhoneNo1() {
		return this.phoneNo1;
	}

	public void setPhoneNo1(String phoneNo1) {
		this.phoneNo1 = phoneNo1;
	}

	public String getPhoneNo2() {
		return this.phoneNo2;
	}

	public void setPhoneNo2(String phoneNo2) {
		this.phoneNo2 = phoneNo2;
	}

	public String getPin() {
		return this.pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Timestamp getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateUser() {
		return this.updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public DistrictMaster getDistrictMaster() {
		return this.districtMaster;
	}

	public void setDistrictMaster(DistrictMaster districtMaster) {
		this.districtMaster = districtMaster;
	}

	public List<BranchAddress> getBranchAddresses() {
		return this.branchAddresses;
	}

	public void setBranchAddresses(List<BranchAddress> branchAddresses) {
		this.branchAddresses = branchAddresses;
	}

	public BranchAddress addBranchAddress(BranchAddress branchAddress) {
		getBranchAddresses().add(branchAddress);
		branchAddress.setAddress(this);

		return branchAddress;
	}

	public BranchAddress removeBranchAddress(BranchAddress branchAddress) {
		getBranchAddresses().remove(branchAddress);
		branchAddress.setAddress(null);

		return branchAddress;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + "]";
	}

}