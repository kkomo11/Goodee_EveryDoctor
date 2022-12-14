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
		
	//환자명
	private String username;
	//주소
	private String userMainAddr;
	//상세주소
	private String userSubAddr;
	//우편번호
	private Integer userPost;
	
	//운송장번호
		private Long drugDeliveryNum;
		//주문번호
		private Long payNum;

}
