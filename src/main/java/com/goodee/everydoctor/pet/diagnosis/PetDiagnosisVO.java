package com.goodee.everydoctor.pet.diagnosis;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime pDansReqTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime pDansEndTime;
	private Integer pDansCost;
	private Integer pDansStatus;
	private List<FileVO> pDansFiles;	// 진료 신청 시 첨부된 파일

}
