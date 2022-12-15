package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Service
public class HospitalDoctorService {
	
	@Autowired
	private HospitalDoctorMapper hospitalDoctorMapper;

	public List<HospitalDoctorVO> findDoctorList(HospitalMainPager hospitalMainPager) throws Exception {
		Long totalCount = hospitalDoctorMapper.findDoctorTotalCount(hospitalMainPager);
		hospitalMainPager.getNum(totalCount);
		hospitalMainPager.getRowNum();
		return hospitalDoctorMapper.findDoctorList(hospitalMainPager);
	}
	
	public HospitalDoctorVO findDoctorDetail(HospitalDoctorVO hospitalDoctorVO) throws Exception {
		return hospitalDoctorMapper.findDoctorDetail(hospitalDoctorVO);
	}
}
