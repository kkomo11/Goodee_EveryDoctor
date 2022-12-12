package com.goodee.everydoctor.pet.diagnosis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.pet.profile.PetVO;
import com.goodee.everydoctor.user.UserVO;
import com.goodee.everydoctor.util.FileManager;

@Service
public class PetDiagnosisService {

	@Autowired
	private PetDiagnosisMapper petDiagnosisMapper;
	
	@Autowired
	private FileMapper fileMapper;

	@Autowired
	private FileManager fileManager;
	
	public PetDiagnosisVO findReservatedDetail(Long n) throws Exception {
		PetDiagnosisVO petDiagnosisVO = new PetDiagnosisVO();
		petDiagnosisVO.setPDansNum(n);
		petDiagnosisVO = petDiagnosisMapper.findReservatedDetail(petDiagnosisVO);
		
		return petDiagnosisVO;
	}
	
	public List<PetDiagnosisVO> findReservatedList(PetDiagnosisPager petDiagnosisPager, String d) throws Exception {
		petDiagnosisPager.setUsername(d);
		Long totalCount = petDiagnosisMapper.findReservatedListCount(petDiagnosisPager);
		petDiagnosisPager.getRowNum();
		petDiagnosisPager.getNum(totalCount);
		
		return petDiagnosisMapper.findReservatedList(petDiagnosisPager);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int inputPetDiagnosis(PetDiagnosisVO petDiagnosisVO, FileVO fileVO) throws Exception{
		
		int result = petDiagnosisMapper.inputPetDiagnosis(petDiagnosisVO);
		
		if(fileVO.getFiles() != null) {
			fileVO.setNum(petDiagnosisVO.getPDansNum().intValue());
			this.saveFile(fileVO);
		}
		
		return result;
	}
	
	public List<HospitalCategoryVO> findPetCategories() throws Exception {
		return petDiagnosisMapper.findPetCategories();
	}
	
	public List<PetVO> findOwnPetList(UserVO userVO) throws Exception {
		return petDiagnosisMapper.findOwnPetList(userVO);
	}
	
	public int findOwnPetCount(UserVO userVO) throws Exception {
		return petDiagnosisMapper.findOwnPetCount(userVO);
	}
	
	private String saveFile(FileVO fileVO)throws Exception{
		//아마 보통 서비스에서 실행하는 코드
		String label = "PETDANS";
		fileVO.setLabel(label);
		
		int result = 0;
		String fileName ="";
		//saveFile
		for(MultipartFile f: fileVO.getFiles()) {
			
			if(!f.isEmpty()) {
				//HDD저장 (저장경로에 label을 추가해준다.)
				fileName = fileManager.saveFile(f, label);
				fileVO.setFileName(fileName);
				fileVO.setFileOriName(f.getOriginalFilename());
				
				//DB저장
				result = fileMapper.inputFile(fileVO);
			}
			
		}
		
		return fileName;
	}
	
}
