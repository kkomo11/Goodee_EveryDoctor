package com.goodee.everydoctor.hospital.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.hospital.doctor.HospitalDoctorVO;

@Mapper
public interface HospitalDiagnosisMapper {
	//진료 신청 insert
	public int inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO);
	
	//요청된 진료 리스트
	public List<HospitalDoctorVO> findHospitalReservatedList(HospitalDoctorVO hospitalDoctorVO);

}
