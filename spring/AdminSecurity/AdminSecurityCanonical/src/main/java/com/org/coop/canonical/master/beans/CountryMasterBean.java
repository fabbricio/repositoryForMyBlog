package com.org.coop.canonical.master.beans;

import java.util.HashSet;
import java.util.Set;

public class CountryMasterBean {
	private int countryId;
	private String countryName;
	private String countryCode;
	private String createUser;
	private String updateUser;
	
	private Set<StateMasterBean> states = new HashSet<StateMasterBean>();
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + countryId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CountryMasterBean other = (CountryMasterBean) obj;
		if (countryId != other.countryId)
			return false;
		return true;
	}
	public int getCountryId() {
		return countryId;
	}
	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public Set<StateMasterBean> getStates() {
		return states;
	}
	public void setStates(Set<StateMasterBean> states) {
		this.states = states;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
}
