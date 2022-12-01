package com.goodee.everydoctor.admin.agency;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AgencyMapper {
	
	//기관 등록
	public int inputAgency (AgencyVO agencyVO)throws Exception;
	
	//기관 조회
	public List<AgencyVO> findAgencyList()throws Exception;

}
