package com.goodee.everydoctor.hospital.diagnosis;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.user.UserVO;

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
	private String username; //환자 아이디
	private String doctorName; //닥터 아이디
	private Long dansStatus; 
	private String patient; //환자 이름
	private List<FileVO> dansFiles;
	private UserVO patientVO; //환자 VO
	private MedicVO medicVO; //의사 VO
	
	private String reqTimeString;		// 진료 요청 시간 보기 좋게 담는 변수
	private String endTimeString;		// 진료 종료 시간 보기 좋게 담는 변수
}
