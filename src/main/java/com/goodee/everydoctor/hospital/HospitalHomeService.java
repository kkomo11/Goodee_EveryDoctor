package com.goodee.everydoctor.hospital;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;

@Service
public class HospitalHomeService {
	
	@Autowired
	private HospitalHomeMapper hospitalHomeMapper;
	
	public List<HospitalSectionVO> findHospitalSection() throws Exception {
		return hospitalHomeMapper.findHospitalSection();
	}
	
	public List<HospitalCategoryVO> findHospitalCategory() throws Exception {
		return hospitalHomeMapper.findHospitalCategory();
	}


}
