package com.goodee.everydoctor.location;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.admin.agency.AgencyVO;

@Mapper
public interface LocationMapper {
	//선별검사소 list
	public List<AgencyVO> findCoronaList()throws Exception;
	//약국 list
	public List<AgencyVO> findPharmacyList()throws Exception;
	//24시 동물병원
	public List<AgencyVO> findNonstopHospital()throws Exception;
	//야간 약국
	public List<AgencyVO> findNightPharmacy()throws Exception;
}
