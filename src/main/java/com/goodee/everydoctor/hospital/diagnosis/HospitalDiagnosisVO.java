package com.goodee.everydoctor.hospital.diagnosis;

import java.sql.Date;

import lombok.Data;

@Data
public class HospitalDiagnosisVO {

	private Long dansNum;
	private String dansCategory;
	private String dansContent;
	private Date dansReqTime;
	private Date dansEndTime;
	private Long dansCost;
	private String username;
	private String doctorName;
	private Long dansStatus;
	private String patient;
}
