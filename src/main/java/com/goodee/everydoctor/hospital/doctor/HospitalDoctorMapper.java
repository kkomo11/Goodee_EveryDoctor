package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HospitalDoctorMapper {

	public List<HospitalDoctorVO> findDoctorList() throws Exception;
	public HospitalDoctorVO findDoctorDetail(HospitalDoctorVO hospitalDoctorVO) throws Exception;
}
