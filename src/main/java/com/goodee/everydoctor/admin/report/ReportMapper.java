package com.goodee.everydoctor.admin.report;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.util.Pager;

@Mapper
public interface ReportMapper {
	//신고내용 INSERT
	public int inputReport(ReportVO reportVO)throws Exception;
	
	//신고리스트 불러오기
	public List<ReportVO> findReportList(Pager pager)throws Exception;
	
	//신고답변 달기
	public int inputReportAnswer(ReportAnswerVO reportAnswerVO)throws Exception;
	
	//신고 디테일 불러오기(모달로)
	public ReportVO findReportDetail(ReportVO reportVO)throws Exception;
	
	//신고 글 총 갯수 구하기
	public Long findCount(Pager pager)throws Exception;
	
	//신고 답변 달면 신고글의 REPORTCHECKED 0 -> 1
	public int modifyReportChecked(int reportNum)throws Exception;
	
}
