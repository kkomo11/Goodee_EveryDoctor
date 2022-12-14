package com.goodee.everydoctor.pet.diagnosis;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.pet.profile.PetBioVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;

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
	private Integer pDansStatus;		// 진료 상태 0 - 대기, 1 - 완료, 2 - 취소됨
	private List<FileVO> pDansFiles;	// 진료 신청 시 첨부된 파일

	private PetVO petVO;				// 진료 받은 반려동물
	private PetBioVO petBioVO;			// 진료 받은 반려동물 하위분류
	private String refBioName;			// 진료 받은 반려동물 상위분류명
	private UserVO userVO;				// 진료 신청자
	
	private String reqTimeString;		// 진료 요청 시간 보기 좋게 담는 변수
	private String endTimeString;		// 진료 종료 시간 보기 좋게 담는 변수
	
	private List<DrugVO> petFills;		// 반려동물 약 처방 내역
	
}
