package com.goodee.everydoctor.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.admin.agency.AgencyVO;

@Service
public class LocationService {
	
	@Autowired
	private LocationMapper locationMapper;
	//선별진료소 list
	public List<AgencyVO> findCoronaList()throws Exception{
		return locationMapper.findCoronaList();
	}
	//약국 list
	public List<AgencyVO> findPharmacyList()throws Exception{
		return locationMapper.findPharmacyList();
	}

}
