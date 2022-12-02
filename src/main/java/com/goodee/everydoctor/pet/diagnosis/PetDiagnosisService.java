package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;

@Service
public class PetDiagnosisService {

	@Autowired
	private PetDiagnosisMapper petDiagnosisMapper;
	
	public List<HospitalCategoryVO> findPetCategories() throws Exception {
		return petDiagnosisMapper.findPetCategories();
	}
	
	public List<PetVO> findOwnPetList(UserVO userVO) throws Exception {
		return petDiagnosisMapper.findOwnPetList(userVO);
	}
	
	public int findOwnPetCount(UserVO userVO) throws Exception {
		return petDiagnosisMapper.findOwnPetCount(userVO);
	}
	
}
