package com.goodee.everydoctor.report;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportService {
	
	@Autowired
	private ReportMapper reportMapper;
	
	//신고 Insert
	public int setReport(ReportVO reportVO)throws Exception{
		int result = reportMapper.setReport(reportVO);
		return result;
	}

}
