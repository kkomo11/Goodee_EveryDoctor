package com.goodee.everydoctor.admin.agency;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AgencyMapper {
	
	//기관 등록
	public int inputAgency (AgencyVO agencyVO)throws Exception;

}
