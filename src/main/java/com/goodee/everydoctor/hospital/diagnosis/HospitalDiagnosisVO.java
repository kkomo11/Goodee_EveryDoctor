package com.goodee.everydoctor.hospital.diagnosis;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.goodee.everydoctor.file.FileVO;

import lombok.Data;

@Data
public class HospitalDiagnosisVO {

	private Long dansNum;
	private String dansCategory;
	private String dansContent;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime dansReqTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private LocalDateTime dansEndTime;
	private Long dansCost;
	private String username;
	private String doctorName;
	private Long dansStatus;
	private String patient;
	private List<FileVO> dansFiles;
	
	private String reqTimeString;		// 진료 요청 시간 보기 좋게 담는 변수
	private String endTimeString;		// 진료 종료 시간 보기 좋게 담는 변수
}
