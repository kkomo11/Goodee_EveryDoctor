package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.pay.PayVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface PetDiagnosisMapper {
	
	public int inputReadyPay(PayVO payVO) throws Exception;		// 의사가 반려동물 진단서를 작성하면 생성되는 결제 대기 정보
	
	public List<DrugVO> findDrug(DrugVO drugVO) throws Exception;	// 처방용 약 검색
	
	public int inputPetFill(DrugVO drugVO) throws Exception;	// 반려동물 진단서 약 처방 내역 입력
	
	public int modifyPetDiagnosis(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 의사가 진단서 작성 후 반려동물 진료 업데이트
	
	public PetDiagnosisVO findDetailForPrescription(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 화상 진료 후 작성할 데이터 불러옴
	
	public List<DrugVO> findPetFills(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 완료된 진료에 포함된 약 처방 내역 조회
	
	public PetDiagnosisVO findCompletedDetail(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 완료된 진료 디테일
	
	public Long findCompletedListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 의사가 완료한 진료 개수
	
	public List<PetDiagnosisVO> findCompletedList(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 의사가 완료한 진료 리스트
	
	public List<FileVO> findFile(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 리스트 및 디테일에서 해당 진료에 첨부된 파일 정보 불러오기
	
	public Long findReservatedListCount(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 의사에게 신청된 진료 개수
	
	public List<PetDiagnosisVO> findReservatedList(PetDiagnosisPager petDiagnosisPager) throws Exception;	// 의사에게 신청된 진료 리스트

	public int inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO) throws Exception;	// 진료 신청
	
	public List<HospitalCategoryVO> findPetCategories() throws Exception;	// 진료 신청 시 진료 카테고리 선택
	
	public List<PetVO> findOwnPetList(UserVO userVO) throws Exception;	// 진료 신청 시 회원이 등록한 반려동물 리스트
	
	public int findOwnPetCount(UserVO userVO) throws Exception;	// 진료 신청 시 회원별 등록된 반려동물 개수 확인
	
}
