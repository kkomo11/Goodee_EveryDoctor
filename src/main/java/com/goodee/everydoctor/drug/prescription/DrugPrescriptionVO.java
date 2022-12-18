package com.goodee.everydoctor.drug.prescription;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.file.FileVO;
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
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime dansReqTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime dansEndTime;
	private Long dansCost;
	private Long dansStatus;
	private String patient;
	private List<FileVO> dansFiles;
	
	private String reqTimeString;		// 진료 요청 시간 보기 좋게 담는 변수
	private String endTimeString;		// 진료 종료 시간 보기 좋게 담는 변수
	//조제상태
	private Long prescriptionStatus;

	//처방전약
	private List<DrugVO> presciptionDrug;
		
	private UserAddressVO userAddressVO;

	//운송장번호
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;

}
