package com.goodee.everydoctor.pet;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface PetHomeMapper {

	public PetdocVO findPetdocDetail(UserVO userVO) throws Exception;
	
	public List<PetdocVO> findPetdocList(PetHomePager pager) throws Exception;
	
	public Long findPetdocTotalCount(PetHomePager pager) throws Exception;
	
}
