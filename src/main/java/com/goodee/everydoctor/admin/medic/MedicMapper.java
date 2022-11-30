package com.goodee.everydoctor.admin.medic;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MedicMapper {
	
	public int inputMedic(MedicVO medicVO)throws Exception;

}
