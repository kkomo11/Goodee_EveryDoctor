package com.goodee.everydoctor.report;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	//신고내용 INSERT
	public int setReport(ReportVO reportVO)throws Exception;
}
