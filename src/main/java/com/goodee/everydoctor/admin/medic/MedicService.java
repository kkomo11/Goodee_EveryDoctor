package com.goodee.everydoctor.admin.medic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MedicService {
	
	@Autowired
	private MedicMapper medicMapper;
	
	//종사자 정보 등록
	public int inputMedic(MedicVO medicVO)throws Exception{
		return(medicMapper.inputMedic(medicVO));
	}

}
