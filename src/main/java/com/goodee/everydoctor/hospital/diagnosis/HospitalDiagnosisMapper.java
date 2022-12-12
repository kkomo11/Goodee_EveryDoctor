package com.goodee.everydoctor.hospital.diagnosis;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HospitalDiagnosisMapper {
	
	public int inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO);

}
