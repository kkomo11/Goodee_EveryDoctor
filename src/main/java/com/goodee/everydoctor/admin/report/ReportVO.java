package com.goodee.everydoctor.admin.report;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReportVO {
	
	private int reportNum;
	@NotNull
	private int reportTypeNum;
	private int reporterName;
	private int reportedName;
	private int consultNum;
	@NotBlank
	private String reportTitle;
	@NotBlank
	private String reportContents;
	private int reportChecked;
	
	private MultipartFile []files;

}
