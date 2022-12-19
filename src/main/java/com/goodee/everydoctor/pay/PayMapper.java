package com.goodee.everydoctor.pay;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface PayMapper {
	
	public Long findMyCompletedPayListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;		// 완료된 결제 개수
	
	public List<PayVO> findMyCompletedPayList(PetDiagnosisPager petDiagnosisPager) throws Exception;	//완료된 결제
	
	public int modifyUnpaidDetail(PayVO payVO) throws Exception;	// 결제 완료 후 결제 테이블 로우 업데이트
	
	public UserVO findMyPayInfo(UserVO userVO) throws Exception;	// ajax용 내 결제정보 조회
	
	public PayVO findUnpaidDetail(PayVO payVO) throws Exception;	// 미납 결제 상세
	
	public int findPayInfoRegisted(UserVO userVO) throws Exception;	// 결제 정보 등록 여부
	
	public Long findMyRequestedPayListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;	//미납된 결제 개수
	
	public List<PayVO> findMyRequestedPayList(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 미납된 결제
	
	public UserVO findMyPay(UserVO userVO) throws Exception;	//내 결제 정보 조회

	public int inputPayInfo(UserVO userVO) throws Exception;	//결제 정보 등록
	
}
