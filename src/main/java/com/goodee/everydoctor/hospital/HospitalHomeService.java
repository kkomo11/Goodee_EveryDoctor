package com.goodee.everydoctor.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HospitalHomeService {
	
	@Autowired
	private HospitalHomeMapper hospitalHomeMapper;
	
	public List<HospitalSectionVO> findHospitalSection() throws Exception {
		return hospitalHomeMapper.findHospitalSection();
	}

}
