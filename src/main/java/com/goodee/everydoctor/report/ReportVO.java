package com.goodee.everydoctor.report;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportVO {
	
	private int reportNum;
	private int reportTypeNum;
	private int reporterId;
	private int reportedId;
	private int consultNum;
	private int AnswerNum;
	private String reportContents;
	private int reportChecked;
	
	private MultipartFile []files;

}
