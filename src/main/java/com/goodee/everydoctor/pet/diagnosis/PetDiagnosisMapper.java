package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface PetDiagnosisMapper {
	
	public List<DrugVO> findPetFills(PetDiagnosisVO petDiagnosisVO) throws Exception;
	
	public PetDiagnosisVO findCompletedDetail(PetDiagnosisVO petDiagnosisVO) throws Exception;
	
	public Long findCompletedListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;
	
	public List<PetDiagnosisVO> findCompletedList(PetDiagnosisPager petDiagnosisPager) throws Exception;
	
	public List<FileVO> findFile(PetDiagnosisVO petDiagnosisVO) throws Exception;
	
	public Long findReservatedListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;
	
	public List<PetDiagnosisVO> findReservatedList(PetDiagnosisPager petDiagnosisPager) throws Exception;

	public int inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO) throws Exception;
	
	public List<HospitalCategoryVO> findPetCategories() throws Exception;
	
	public List<PetVO> findOwnPetList(UserVO userVO) throws Exception;
	
	public int findOwnPetCount(UserVO userVO) throws Exception;
	
}
