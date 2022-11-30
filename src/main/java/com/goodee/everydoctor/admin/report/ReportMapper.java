package com.goodee.everydoctor.admin.report;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	//신고내용 INSERT
	public int inputReport(ReportVO reportVO)throws Exception;
}
