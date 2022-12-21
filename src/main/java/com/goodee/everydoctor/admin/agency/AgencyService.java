package com.goodee.everydoctor.admin.agency;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalSectionVO;
import com.goodee.everydoctor.util.FileManager;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AgencyService {

	@Autowired
	private AgencyMapper agencyMapper;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private FileMapper fileMapper;

	private String label = "AGENCY";

	//기관 등록
	public int inputAgency(AgencyVO agencyVO)throws Exception{
		int result = agencyMapper.inputAgency(agencyVO);

		//받아온 파일들을 반복문 돌려서 HDD 저장 및 DB에 저장
		for(MultipartFile f : agencyVO.getFiles()) {
			log.info("fileName : ", f.getOriginalFilename());
			String fileName = fileManager.saveFile(f, label);
			FileVO fileVO = new FileVO();
			fileVO.setFileName(fileName);
			fileVO.setNum(agencyVO.getAgencyNum());
			fileVO.setFileOriName(f.getOriginalFilename());
			fileVO.setLabel(label);

			//DB 저장
			fileMapper.inputFile(fileVO);
		}
		return result;
	}

	//기관 조회
	public List<AgencyVO> findAgencyList()throws Exception{
		return(agencyMapper.findAgencyList());
	}

	//병원 조회
	public List<AgencyVO> findHospitalList()throws Exception{
		return(agencyMapper.findHospitalList());
	}

	//동물병원 조회
	public List<AgencyVO> findPetHospitalList()throws Exception{
		return(agencyMapper.findPetHospitalList());
	}

	//약국 조회
	public List<AgencyVO> findPharmacyList()throws Exception{
		return(agencyMapper.findPharmacyList());
	}

	//보호소 조회
	public List<AgencyVO> findPetHotelList()throws Exception{
		return(agencyMapper.findPetHotelList());
	}

	//기관운영시간 입력
	public int inputAgencyWorkHour (AgencyWorkHourVO agencyWorkHourVO)throws Exception{
		return (agencyMapper.inputAgencyWorkHour(agencyWorkHourVO));
	}

	//동물병원 진료과목 불러오기
	public List<HospitalSectionVO> findPetHospitalSection()throws Exception{
		return agencyMapper.findPetHospitalSection();
	}

	//기관 영구 삭제
	public int deleteAgency(AgencyVO agencyVO)throws Exception{
		List<FileVO> fileVOs = agencyMapper.findAgencyFile(agencyVO);
		for(FileVO f : fileVOs) {
			if(f != null) {
				f.setLabel(label);
				fileManager.deleteFile(f);
			}
		}
		return agencyMapper.deleteAgency(agencyVO);
	}

}
