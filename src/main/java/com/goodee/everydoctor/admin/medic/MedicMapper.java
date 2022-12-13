package com.goodee.everydoctor.admin.medic;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MedicMapper {
	
	//종사자 정보 등록
	public int inputMedic(MedicVO medicVO)throws Exception;
	
	//의사, 수의사 진료과목(MEDICSECTION) 정보 입력
	public int inputMedicSection(MedicSectionVO medicSectionVO)throws Exception;

}
