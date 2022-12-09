package com.goodee.everydoctor.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//특정 제휴신청 리스트 불러오기
		public List<MedicVO> findCooperationList(Pager pager)throws Exception{
			Long totalCount = adminMapper.findCooperationCount(pager);
			pager.getNum(totalCount);
			pager.getRowNum();
			return adminMapper.findCooperationList(pager);
		}

}
