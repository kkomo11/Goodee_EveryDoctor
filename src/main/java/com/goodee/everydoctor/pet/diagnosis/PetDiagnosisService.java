package com.goodee.everydoctor.pet.diagnosis;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.drug.DrugVO;
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
	
	public PetDiagnosisVO findCompletedDetail(Long n) throws Exception {
		PetDiagnosisVO petDiagnosisVO = new PetDiagnosisVO();
		petDiagnosisVO.setPDansNum(n);
		
		petDiagnosisVO = petDiagnosisMapper.findCompletedDetail(petDiagnosisVO);
		
		// LocalDateTime을 보기 좋게 변환
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String reqTimeString = petDiagnosisVO.getPDansReqTime().format(dtf);
		String endTimeString = petDiagnosisVO.getPDansEndTime().format(dtf);
		
		petDiagnosisVO.setReqTimeString(reqTimeString);
		petDiagnosisVO.setEndTimeString(endTimeString);
		
		List<FileVO> files = petDiagnosisMapper.findFile(petDiagnosisVO);
		petDiagnosisVO.setPDansFiles(files);
		
		// 반려동물 약 처방 내역 정보 조회
		List<DrugVO> fills = petDiagnosisMapper.findPetFills(petDiagnosisVO);
		petDiagnosisVO.setPetFills(fills);
		
		return petDiagnosisVO;
	}
	
	public List<PetDiagnosisVO> findCompletedList(PetDiagnosisPager petDiagnosisPager, String d) throws Exception {
		
		petDiagnosisPager.setUsername(d);
		Long totalCount = petDiagnosisMapper.findCompletedListCount(petDiagnosisPager);
		petDiagnosisPager.getNum(totalCount);
		petDiagnosisPager.getRowNum();
		
		List<PetDiagnosisVO> pdList = petDiagnosisMapper.findCompletedList(petDiagnosisPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		for(PetDiagnosisVO p : pdList) {
			String reqTimeString = p.getPDansReqTime().format(dtf);
			String endTimeString = p.getPDansEndTime().format(dtf);
			p.setReqTimeString(reqTimeString);
			p.setEndTimeString(endTimeString);
			
			List<FileVO> files = petDiagnosisMapper.findFile(p);
			p.setPDansFiles(files);
		}
		
		return pdList;
	}
	
	public List<PetDiagnosisVO> findReservatedList(PetDiagnosisPager petDiagnosisPager, String d) throws Exception {
		petDiagnosisPager.setUsername(d);
		Long totalCount = petDiagnosisMapper.findReservatedListCount(petDiagnosisPager);
		petDiagnosisPager.getNum(totalCount);
		petDiagnosisPager.getRowNum();
		
		List<PetDiagnosisVO> pdList = petDiagnosisMapper.findReservatedList(petDiagnosisPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		for(PetDiagnosisVO p : pdList) {
			String reqTimeString = p.getPDansReqTime().format(dtf);
			p.setReqTimeString(reqTimeString);
			
			// 진료에 포함된 사진 파일 정보 db에서 가져옴 (그냥 resultMap으로 조인해서 결과를 넣으면 사진의 개수만큼 Row가 중복)
			List<FileVO> files = petDiagnosisMapper.findFile(p);
			p.setPDansFiles(files);
		}
		
		return pdList;
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
