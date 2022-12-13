package com.goodee.everydoctor.pet.diagnosis;

import java.sql.Time;
import java.util.List;

import com.goodee.everydoctor.file.FileVO;

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
	private List<FileVO> pDansFiles;	// 진료 신청 시 첨부된 파일

}
