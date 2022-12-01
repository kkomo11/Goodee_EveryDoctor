package com.goodee.everydoctor.admin.medic;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MedicMapper {
	
	//종사자 정보 등록
	public int inputMedic(MedicVO medicVO)throws Exception;

}
