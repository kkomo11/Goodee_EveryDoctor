package com.goodee.everydoctor.admin.agency;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AgencyMapper {
	
	//기관 등록
	public int inputAgency (AgencyVO agencyVO)throws Exception;
	
	//기관 조회
	public List<AgencyVO> findAgencyList()throws Exception;
	
	//기관별 조회
	//병원 조회
	public List<AgencyVO> findHospitalList()throws Exception;
	
	//동물병원 조회
	public List<AgencyVO> findPetHospitalList()throws Exception;
	
	//약국 조회
	public List<AgencyVO> findPharmacyList()throws Exception;
	
	//보호소 조회
	public List<AgencyVO> findPetHotelList()throws Exception;

}
