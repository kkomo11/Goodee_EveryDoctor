package com.goodee.everydoctor.drug.prescription;

import com.goodee.everydoctor.user.address.UserAddressVO;

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
	
	//진료테이블
	//진료번호
	private Long dansNum;
	//상담내용
	private String dansContent;
	//환자아이디
	private String username;
	
	//처방전테이블
	//처방전약테이블
	
	private UserAddressVO userAddressVO;

	//운송장번호
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;

}
