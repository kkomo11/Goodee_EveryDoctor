package com.goodee.everydoctor.drug.prescription;

import lombok.Data;

@Data
public class DrugPrescriptionVO {

	//약번호
	private Long drugNum;
	//약이름(제품명)
	private String drugName;
	//약소개
	private String drugInfo;
	//약사용법
	private String drugUse;
	//약주의사항
	private String drugCare;

	private Integer categoryNum;
	//환자 증상명
	private String categoryName;
	//진료 과목명
	private String sectionName;

}
