package com.goodee.everydoctor.pet;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PetHomeMapper {

	public List<PetdocVO> findPetdocList(PetHomePager pager) throws Exception;
	
	public Long findPetdocTotalCount(PetHomePager pager) throws Exception;
	
}
