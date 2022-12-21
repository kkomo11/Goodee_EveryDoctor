package com.goodee.everydoctor.drug.prescription;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileMapper;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisMapper;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.util.FileManager;


@Service
public class DrugPrescriptionService {

	@Autowired
	private DrugPrescriptionMapper drugPrescriptionMapper;

	public DrugPrescriptionVO findDrugPrescriptionDetail(DrugPrescriptionVO drugPrescriptionVO)throws Exception {
		// TODO Auto-generated method stub
		return  drugPrescriptionMapper.findDrugPrescriptionDetail(drugPrescriptionVO);
	}

	public List<DrugPrescriptionVO> findDrugPrescriptionList(DrugPrescriptionVO drugPrescriptionVO)throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.findDrugPrescriptionList(drugPrescriptionVO);
	}

	public  List<DrugPrescriptionVO> findDrugDeliveryNum()throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.findDrugDeliveryNum();
	}

	public List<HospitalDiagnosisVO> findCompletedList(DrugPrescriptionPager drugPrescriptionPager) throws Exception {

		Long totalCount = drugPrescriptionMapper.findCompletedListCount(drugPrescriptionPager);
		drugPrescriptionPager.getNum(totalCount);
		drugPrescriptionPager.getRowNum();

		List<HospitalDiagnosisVO> dList = drugPrescriptionMapper.findCompletedList(drugPrescriptionPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		for(HospitalDiagnosisVO d : dList) {
			String reqTimeString = d.getDansReqTime().format(dtf);
			String endTimeString = d.getDansEndTime().format(dtf);
			d.setReqTimeString(reqTimeString);
			d.setEndTimeString(endTimeString);

			List<FileVO> files = drugPrescriptionMapper.findFile(d);
			d.setDansFiles(files);
		}

		return dList;
	}

	public List<HospitalDiagnosisVO> findCompletedListResult(DrugPrescriptionPager drugPrescriptionPager) throws Exception {

		Long totalCount = drugPrescriptionMapper.findCompletedListCount(drugPrescriptionPager);
		drugPrescriptionPager.getNum(totalCount);
		drugPrescriptionPager.getRowNum();

		List<HospitalDiagnosisVO> dList = drugPrescriptionMapper.findCompletedListResult(drugPrescriptionPager);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		for(HospitalDiagnosisVO d : dList) {
			String reqTimeString = d.getDansReqTime().format(dtf);
			String endTimeString = d.getDansEndTime().format(dtf);
			d.setReqTimeString(reqTimeString);
			d.setEndTimeString(endTimeString);

			List<FileVO> files = drugPrescriptionMapper.findFile(d);
			d.setDansFiles(files);
		}

		return dList;
	}

	public int modifyPrescriptionStatus(DrugPrescriptionVO drugPrescriptionVO) throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.modifyPrescriptionStatus(drugPrescriptionVO);
	}

}
