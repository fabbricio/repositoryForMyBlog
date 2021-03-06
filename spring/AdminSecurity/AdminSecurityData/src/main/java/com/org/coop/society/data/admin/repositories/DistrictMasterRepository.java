package com.org.coop.society.data.admin.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.org.coop.society.data.admin.entities.DistrictMaster;

public interface DistrictMasterRepository extends JpaRepository<DistrictMaster, Integer> {
	public DistrictMaster findByDistId(int distId);
	public DistrictMaster findByDistrictCode(String districtCode);
}
