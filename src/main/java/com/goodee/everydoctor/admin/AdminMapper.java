package com.goodee.everydoctor.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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
}
