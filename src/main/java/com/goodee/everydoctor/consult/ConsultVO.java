package com.goodee.everydoctor.consult;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Range;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;

import lombok.Data;

@Data
public class ConsultVO {

	private Long consultNum;
	private String username;
	private String consultTitle;
	private String consultContent;
	private Date consultReqDate;
	private Integer consultKind;
	
	private Integer consultCategory;	// 무료 상담 작성을 위한 멤버
	
	private List<HospitalCategoryVO> hospitalCategoryVO;
	
	private List<FileVO> consultFiles;
	
}
