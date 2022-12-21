package com.goodee.everydoctor.pay;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.drug.delivery.DrugDeliveryVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;
import com.goodee.everydoctor.user.UserVO;
import com.goodee.everydoctor.user.address.UserAddressVO;

@Mapper
public interface PayMapper {
	
	public Long findPayAboutPetdocCount(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 수의사가 자신이 본 진료의 결제 리스트 개수
	
	public List<PayVO> findPayAboutPetdoc(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 수의사가 자신이 본 진료의 결제 여부 확인용 리스트
	
	public int inputDrugDelivery(DrugDeliveryVO drugDeliveryVO) throws Exception;	// 배송결제 후 배송정보 입력
	
	public List<DrugDeliveryVO> findDeliveryNum() throws Exception;				// 배송결제시 할당 가능한 운송장번호 검색
	
	public List<UserAddressVO> findUserAddress(UserAddressVO userAddressVO) throws Exception;	// 배송결제 시 등록된 배송지 정보 조회
	
	public int findAddressCount(UserVO userVO) throws Exception;				// 배송 결제로 넘어가기 전에 배송지를 등록했나 체크
	
	public int findFillCount(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 배송 결제로 넘어가기 전에 처방받은 약이 있나 체크
	
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
