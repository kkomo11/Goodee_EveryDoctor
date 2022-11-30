package com.goodee.everydoctor.admin.agency;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgencyService {
	
	@Autowired
	private AgencyMapper agencyMapper;
	
	public int inputAgency(AgencyVO agencyVO)throws Exception{
		return(agencyMapper.inputAgency(agencyVO));
	}

}
