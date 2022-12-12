package com.goodee.everydoctor.drug.prescription;


import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class DrugPrescriptionVO {
	
	//운송장번호
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;
	
	private Integer categoryNum;
	//환자 증상명
	private String categoryName;
	//진료 과목명
	private String sectionName;
	
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
	
	private UserVO userVO;
	
	

}
