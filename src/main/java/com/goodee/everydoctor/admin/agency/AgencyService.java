package com.goodee.everydoctor.admin.agency;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgencyService {
	
	@Autowired
	private AgencyMapper agencyMapper;
	
	//기관 등록
	public int inputAgency(AgencyVO agencyVO)throws Exception{
		return(agencyMapper.inputAgency(agencyVO));
	}
	
	//기관 조회
	public List<AgencyVO> findAgencyList()throws Exception{
		return(agencyMapper.findAgencyList());
	}

}
