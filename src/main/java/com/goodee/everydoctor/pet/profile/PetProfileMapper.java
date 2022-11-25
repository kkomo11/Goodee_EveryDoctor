package com.goodee.everydoctor.pet.profile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetProfileMapper {

	public int deletePetProfile(PetVO petVO) throws Exception;
	
	public int modifyPetProfile(PetVO petVO) throws Exception;
	
	public PetBioVO findPetBioDetail(PetBioVO petBioVO) throws Exception;
	
	public PetVO findPetProfileDetail(PetVO petVO) throws Exception;
	
	public int inputPetProfile(PetVO petVO) throws Exception;
	
	public List<PetBioVO> findPetBioList() throws Exception;
	
	public List<PetBioVO> findPetBioDetailList(PetBioVO petBioVO) throws Exception;
	
	public List<PetBioVO> findPetBioDetailSearch(PetBioVO petBioVO) throws Exception;
	
}
