package com.goodee.everydoctor.hospital.diagnosis;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.drug.DrugVO;
import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.doctor.HospitalDoctorVO;
import com.goodee.everydoctor.pay.PayVO;
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
	public List<HospitalDiagnosisVO> findHospitalReservatedList(HospitalDiagnosisPager hospitalDiagnosisPager)throws Exception{
		
		Long totalCount = hospitalDiagnosisMapper.findReservatedListCount(hospitalDiagnosisPager);
		hospitalDiagnosisPager.getNum(totalCount);
		hospitalDiagnosisPager.getRowNum();
		List<HospitalDiagnosisVO> dList = hospitalDiagnosisMapper.findHospitalReservatedList(hospitalDiagnosisPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		for(HospitalDiagnosisVO d : dList) {
			String reqTimeString = d.getDansReqTime().format(dtf);
			d.setReqTimeString(reqTimeString);
			
			// 진료에 포함된 사진 파일 정보 db에서 가져옴 (그냥 resultMap으로 조인해서 결과를 넣으면 사진의 개수만큼 Row가 중복)
			List<FileVO> files = hospitalDiagnosisMapper.findFile(d);
			d.setDansFiles(files);
		}
		return dList;
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
	
	public HospitalDiagnosisVO findCompletedDetail(HospitalDiagnosisVO hospitalDiagnosisVO) throws Exception {
		
		hospitalDiagnosisVO = hospitalDiagnosisMapper.findCompletedDetail(hospitalDiagnosisVO);
		
		// LocalDateTime을 보기 좋게 변환
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String reqTimeString = hospitalDiagnosisVO.getDansReqTime().format(dtf);
		String endTimeString = hospitalDiagnosisVO.getDansEndTime().format(dtf);
		
		hospitalDiagnosisVO.setReqTimeString(reqTimeString);
		hospitalDiagnosisVO.setEndTimeString(endTimeString);
		
		List<FileVO> files = hospitalDiagnosisMapper.findFile(hospitalDiagnosisVO);
		hospitalDiagnosisVO.setDansFiles(files);
		
		// 약 처방 내역 정보 조회
		List<DrugVO> fills = hospitalDiagnosisMapper.findFills(hospitalDiagnosisVO);
		hospitalDiagnosisVO.setFills(fills);
		
		return hospitalDiagnosisVO;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int modifyHospitalDiagnosis(HospitalDiagnosisVO hospitalDiagnosisVO, Long[] druges) throws Exception {
		
		int modifyResult = hospitalDiagnosisMapper.modifyHospitalDiagnosis(hospitalDiagnosisVO);
		
		if(druges != null) {
			for(Long i : druges) {
				if(i != null) {
					DrugVO drugVO = new DrugVO();
					drugVO.setDrugNum(i);
					drugVO.setPDansNum(hospitalDiagnosisVO.getDansNum());
					
					hospitalDiagnosisMapper.inputFill(drugVO);
				}
			}
		}
		
		PayVO payVO = new PayVO();
		payVO.setUsername(hospitalDiagnosisVO.getUsername());
		String orderId = UUID.randomUUID().toString();
		payVO.setOrderId(orderId);
		payVO.setAmount(hospitalDiagnosisVO.getDansCost());
		payVO.setDansNum(hospitalDiagnosisVO.getDansNum());
		
		int inputPayResult = hospitalDiagnosisMapper.inputReadyPay(payVO);
		
		int result = 0;
		
		if(modifyResult > 0 && inputPayResult > 0) {
			result = 1;
		}

		return result;
	}
}
