package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HospitalDoctorService {
	
	@Autowired
	private HospitalDoctorMapper hospitalDoctorMapper;

	public List<HospitalDoctorVO> findDoctorList() throws Exception {
		return hospitalDoctorMapper.findDoctorList();
	}
	
	public HospitalDoctorVO findDoctorDetail(HospitalDoctorVO hospitalDoctorVO) throws Exception {
		return hospitalDoctorMapper.findDoctorDetail(hospitalDoctorVO);
	}
}
