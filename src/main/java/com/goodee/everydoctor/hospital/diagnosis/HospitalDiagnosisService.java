package com.goodee.everydoctor.hospital.diagnosis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.util.FileManager;

@Service
public class HospitalDiagnosisService {
	
	@Autowired
	private HospitalDiagnosisMapper hospitalDiagnosisMapper;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FileMapper fileMapper;
	
	
	public int inputHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO, FileVO fileVO)throws Exception{
		//label
		String label = "DANS";
		
		//DB에 저장하고
		int result = hospitalDiagnosisMapper.inputHospitalDiagnosis(hospitalDiagnosisVO);
		fileVO.setNum(hospitalDiagnosisVO.getDansNum().intValue());
		fileVO.setLabel("DANS");
		
		//file도 저장하고
		for(MultipartFile f: fileVO.getFiles()) {
			//HDD저장 (저장경로에 label을 추가해준다.)
			String fileName = fileManager.saveFile(f, label);
			fileVO.setFileName(fileName);
			fileVO.setFileOriName(f.getOriginalFilename());
			
			//DB저장
			result = fileMapper.inputFile(fileVO);
		}
		
		return result;
	}

}
