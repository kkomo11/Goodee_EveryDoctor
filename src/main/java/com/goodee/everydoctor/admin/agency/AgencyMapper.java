package com.goodee.everydoctor.admin.agency;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalSectionVO;

@Mapper
public interface AgencyMapper {
	
	//기관 등록
	public int inputAgency (AgencyVO agencyVO)throws Exception;
	
	//기관 조회
	public List<AgencyVO> findAgencyList()throws Exception;
	
	//기관별 조회
	//병원 조회
	public List<AgencyVO> findHospitalList()throws Exception;
	
	//동물병원 조회
	public List<AgencyVO> findPetHospitalList()throws Exception;
	
	//약국 조회
	public List<AgencyVO> findPharmacyList()throws Exception;
	
	//보호소 조회
	public List<AgencyVO> findPetHotelList()throws Exception;
	
	//기관 운영 시간 등록
	public int inputAgencyWorkHour (AgencyWorkHourVO agencyWorkHourVO)throws Exception;
	
	//동물병원 진료과목 불러오기
	public List<HospitalSectionVO> findPetHospitalSection()throws Exception;
	
	//기관 삭제
	public int deleteAgency(AgencyVO agencyVO)throws Exception;
	
	//기관 사진 삭제를 위한 파일 정보 불러오기
	public List<FileVO> findAgencyFile(AgencyVO agencyVO)throws Exception;

}
