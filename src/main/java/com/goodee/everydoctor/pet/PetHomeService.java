package com.goodee.everydoctor.pet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.user.UserVO;

@Service
public class PetHomeService {

	@Autowired
	private PetHomeMapper petHomeMapper;
	
	public PetdocVO findPetdocDetail(UserVO userVO) throws Exception {
		return petHomeMapper.findPetdocDetail(userVO);
	}
	
	public List<PetdocVO> findPetdocList(PetHomePager pager) throws Exception {
		
		Long totalCount = petHomeMapper.findPetdocTotalCount(pager);
		pager.getNum(totalCount);
		pager.getRowNum();
		
		return petHomeMapper.findPetdocList(pager);
	}
	
}
