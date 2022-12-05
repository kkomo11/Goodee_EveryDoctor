package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface PetDiagnosisMapper {

	public int inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO) throws Exception;
	
	public List<HospitalCategoryVO> findPetCategories() throws Exception;
	
	public List<PetVO> findOwnPetList(UserVO userVO) throws Exception;
	
	public int findOwnPetCount(UserVO userVO) throws Exception;
	
}
