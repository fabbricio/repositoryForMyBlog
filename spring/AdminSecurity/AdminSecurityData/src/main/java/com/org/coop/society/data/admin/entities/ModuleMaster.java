package com.org.coop.society.data.admin.entities;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.Where;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the module_master database table.
 * 
 */
@Entity
@Table(name="module_master")
@NamedQuery(name="ModuleMaster.findAll", query="SELECT m FROM ModuleMaster m")
public class ModuleMaster implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="module_id")
	private int moduleId;

	@Column(name="create_date", updatable=false)
	private Timestamp createDate;

	@Column(name="create_user")
	private String createUser;

	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	private Date endDate;

	@Column(name="module_name")
	private String moduleName;

	@Column(name="delete_ind")
	private String deleteInd;
	
	@Temporal(TemporalType.DATE)
	@Column(name="start_date")
	private Date startDate;

	@Column(name="update_date", insertable=false)
	private Timestamp updateDate;

	@Column(name="update_user")
	private String updateUser;

	//bi-directional many-to-one association to PermissionMaster        
	@OneToMany(mappedBy="moduleMaster", cascade=CascadeType.ALL)
	@Where(clause="delete_ind is NULL or delete_ind='N'")
	private List<PermissionMaster> permissionMasters;

	//bi-directional many-to-one association to RuleMaster
	@OneToMany(mappedBy="moduleMaster", cascade=CascadeType.ALL)
	private List<RuleMaster> ruleMasters;

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + moduleId;
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
		ModuleMaster other = (ModuleMaster) obj;
		if (moduleId != other.moduleId)
			return false;
		return true;
	}

	public String getDeleteInd() {
		return deleteInd;
	}
	public void setDeleteInd(String deleteInd) {
		this.deleteInd = deleteInd;
	}
	
	public ModuleMaster() {
	}

	public int getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
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

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
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

	public List<PermissionMaster> getPermissionMasters() {
		return this.permissionMasters;
	}

	public void setPermissionMasters(List<PermissionMaster> permissionMasters) {
		this.permissionMasters = permissionMasters;
	}

	public PermissionMaster addPermissionMaster(PermissionMaster permissionMaster) {
		getPermissionMasters().add(permissionMaster);
		permissionMaster.setModuleMaster(this);

		return permissionMaster;
	}

	public PermissionMaster removePermissionMaster(PermissionMaster permissionMaster) {
		getPermissionMasters().remove(permissionMaster);
		permissionMaster.setModuleMaster(null);

		return permissionMaster;
	}

	public List<RuleMaster> getRuleMasters() {
		return this.ruleMasters;
	}

	public void setRuleMasters(List<RuleMaster> ruleMasters) {
		this.ruleMasters = ruleMasters;
	}

	public RuleMaster addRuleMaster(RuleMaster ruleMaster) {
		getRuleMasters().add(ruleMaster);
		ruleMaster.setModuleMaster(this);

		return ruleMaster;
	}

	public RuleMaster removeRuleMaster(RuleMaster ruleMaster) {
		getRuleMasters().remove(ruleMaster);
		ruleMaster.setModuleMaster(null);

		return ruleMaster;
	}
	@PreUpdate
	@PrePersist
	public void updateTimeStamps() {
	    updateDate = new Timestamp(System.currentTimeMillis());
	    if (createDate == null) {
	    	createDate = new Timestamp(System.currentTimeMillis());
	    }
	}
}