package com.goodee.everydoctor.hospital.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.doctor.HospitalDoctorVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;

@Mapper
public interface HospitalDiagnosisMapper {
	//진료 신청 insert
	public int inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO);
	
	//요청된 진료 리스트
	public List<HospitalDiagnosisVO> findHospitalReservatedList(HospitalDiagnosisPager hospitalDiagnosisPager);
	
	public Long findCompletedListCount(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception;

	public List<FileVO> findFile(HospitalDiagnosisVO hospitalDiagnosisVO) throws Exception;
	
	public List<HospitalDiagnosisVO> findCompletedList(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception;
	
	public Long findReservatedListCount(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception;
}
