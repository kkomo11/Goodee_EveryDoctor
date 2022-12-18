package com.goodee.everydoctor.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.user.UserMapper;
import com.goodee.everydoctor.user.UserVO;
import com.goodee.everydoctor.util.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private UserMapper userMapper;
	
		//특정 제휴신청 리스트 불러오기
		public List<MedicVO> findCooperationList(Pager pager)throws Exception{
			Long totalCount = adminMapper.findCooperationCount(pager);
			pager.getNum(totalCount);
			pager.getRowNum();
			return adminMapper.findCooperationList(pager);
		}
		
		//제휴신청 리스트 페이지 모달창에 가져올 Detail 내용
		public MedicVO findCooperationDetail(String username)throws Exception{
			return adminMapper.findCooperationDetail(username);
		}
		
		//관리자 승인 시 종사자 role 의사로 바꾸기
		public int inputRoleDoctor(UserVO userVO)throws Exception{
			return userMapper.inputRoleDoctor(userVO);
		}
		
		//관리자 승인 시 종사자 role 간호사로 바꾸기
		public int inputRoleNurse(UserVO userVO)throws Exception{
			return userMapper.inputRoleNurse(userVO);
		}
		
		//관리자 승인 시 종사자 role 수의사로 바꾸기
		public int inputRolePetDoc(UserVO userVO)throws Exception{
			return userMapper.inputRolePetdoc(userVO);
		}
		
		//관리자 승인 시 종사자 role 수간호사로 바꾸기
		public int inputRolePetnurse(UserVO userVO)throws Exception{
			return userMapper.inputRolePetnurse(userVO);
		}
		
		//MedicEnabled 1로 변경
		public int modifyMedicEnabled(String username)throws Exception{
			return adminMapper.modifyMedicEnabled(username);
		}
		
		//이번 달 신청된 병원 진료 수
		public int findMonthlyDiagnosisCount()throws Exception{
			return adminMapper.findMonthlyDiagnosisCount();
		};
		
		//오늘 신청된 병원 진료 수
		public int findDailyDiagnosisCount()throws Exception{
			return adminMapper.findDailyDiagnosisCount();
		};
		
		//이번 달 신청된 동물병원 진료 수
		public int findMonthlyPetDiagnosisCount()throws Exception{
			return adminMapper.findMonthlyPetDiagnosisCount();
		};
		
		//오늘 신청된 동물병원 진료 수
		public int findDailyPetDiagnosisCount()throws Exception{
			return adminMapper.findDailyPetDiagnosisCount();
		};
		
		//이번달 접수된 총 신고 수
		public int findThisMonthReport()throws Exception{
			return adminMapper.findThisMonthReport();
		};
		
		//이번 달 접수된 신고중에 답변처리 완료된 신고
		public int findThisMonthReportChecked()throws Exception{
			return adminMapper.findThisMonthReportChecked();
		};
		
}
