package com.goodee.everydoctor.admin.report;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportAnswerVO {
	private int reportAnswerNum;
	private int reportNum;
	private String ReportAnswerContents;
	private Date reportAnswerDate;

}
