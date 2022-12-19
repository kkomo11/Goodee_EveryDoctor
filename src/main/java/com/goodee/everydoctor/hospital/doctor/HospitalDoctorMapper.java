package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Mapper
public interface HospitalDoctorMapper {

	public List<HospitalDoctorVO> findDoctorList(HospitalMainPager hospitalMainPager) throws Exception;
	public HospitalDoctorVO findDoctorDetail(HospitalDoctorVO hospitalDoctorVO) throws Exception;
	public Long findDoctorTotalCount(HospitalMainPager hospitalMainPager) throws Exception;
}
