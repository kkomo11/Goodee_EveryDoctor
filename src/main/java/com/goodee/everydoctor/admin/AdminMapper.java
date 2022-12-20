package com.goodee.everydoctor.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.util.Pager;

@Mapper
public interface AdminMapper {
	//제휴신청 리스트 불러오기 AJAX
	public List<MedicVO> findCooperationList(Pager pager)throws Exception;
	
	//제휴신청 리스트 페이징에 필요한 count
	public Long findCooperationCount(Pager pager)throws Exception;
	
	//제휴신청 리스트 모달창에 가져올 Detail 내용
	public MedicVO findCooperationDetail(String username)throws Exception;
	
	//medicEnabled 1로 수정
	public int modifyMedicEnabled(String username)throws Exception;
	
	//이번 달 신청된 병원 진료 수
	public int findMonthlyDiagnosisCount()throws Exception;
	
	//오늘 신청된 병원 진료 수
	public int findDailyDiagnosisCount()throws Exception;
	
	//이번 달 신청된 동물병원 진료 수
	public int findMonthlyPetDiagnosisCount()throws Exception;
	
	//오늘 신청된 동물병원 진료 수
	public int findDailyPetDiagnosisCount()throws Exception;
	
	//이번달 접수된 총 신고 수
	public int findThisMonthReport()throws Exception;
	
	//이번 달 접수된 신고중에 답변처리 완료된 신고
	public int findThisMonthReportChecked()throws Exception;
	
	//기관 리스트 불러오기 AJAX
	public List<AgencyVO> findAgencyList(Pager pager)throws Exception;
		
	//기관 리스트 페이징에 필요한 count
	public Long findAgencyCount(Pager pager)throws Exception;
	
	//기관 삭제
	public int deleteAgency(int agencyNum)throws Exception;
}
