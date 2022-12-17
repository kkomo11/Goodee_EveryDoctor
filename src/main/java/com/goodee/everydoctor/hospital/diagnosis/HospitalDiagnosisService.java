package com.goodee.everydoctor.hospital.diagnosis;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.doctor.HospitalDoctorVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisPager;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;
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
		if(fileVO.getFiles() != null) {
			for(MultipartFile f: fileVO.getFiles()) {
				//HDD저장 (저장경로에 label을 추가해준다.)
				String fileName = fileManager.saveFile(f, label);
				fileVO.setFileName(fileName);
				fileVO.setFileOriName(f.getOriginalFilename());
				
				//DB저장
				result = fileMapper.inputFile(fileVO);
			}
		}
		
		return result;
	}
	//요청된 진료 리스트
	public List<HospitalDoctorVO> findHospitalReservatedList(HospitalDoctorVO hospitalDoctorVO)throws Exception{
		
		return  hospitalDiagnosisMapper.findHospitalReservatedList(hospitalDoctorVO);
	}

	public List<HospitalDiagnosisVO> findCompletedList(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception {
		
		Long totalCount = hospitalDiagnosisMapper.findCompletedListCount(hospitalDiagnosisPager);
		hospitalDiagnosisPager.getNum(totalCount);
		hospitalDiagnosisPager.getRowNum();
		
		List<HospitalDiagnosisVO> dList = hospitalDiagnosisMapper.findCompletedList(hospitalDiagnosisPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		for(HospitalDiagnosisVO d : dList) {
			String reqTimeString = d.getDansReqTime().format(dtf);
			String endTimeString = d.getDansEndTime().format(dtf);
			d.setReqTimeString(reqTimeString);
			d.setEndTimeString(endTimeString);
			
			List<FileVO> files = hospitalDiagnosisMapper.findFile(d);
			d.setDansFiles(files);
		}
		
		return dList;
	}
}
