package com.goodee.everydoctor.pet.diagnosis;

import java.sql.Time;

import lombok.Data;

@Data
public class PetDiagnosisVO {
	
	private Long pDansNum;
	private String pUsername;
	private Long petNum;
	private String pDoctorname;
	private String pDansCategory;
	private String pDansContent;
	private String pDansResponse;
	private String pDansAid;
	private Time pDansReqTime;
	private Time pDansEndTime;
	private Integer pDansCost;
	private Integer pDansStatus;

}
