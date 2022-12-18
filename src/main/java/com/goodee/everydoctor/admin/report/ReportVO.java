package com.goodee.everydoctor.admin.report;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;

import lombok.Data;

@Data
public class ReportVO {
	
	private int reportNum;
	@NotNull
	private int reportTypeNum;
	private String reporterName;
	private String reportedName;
	private int consultNum;
	@NotBlank
	private String reportTitle;
	@NotBlank
	private String reportContents;
	private int reportChecked;
	private Date reportDate;
	
	private MultipartFile []files;
	
	//신고 디테일 불러오기 위한 VO
	private ReportAnswerVO reportAnswerVO;
	private ReportTypeVO reportTypeVO;
	private List<FileVO> fileVOs;

}
