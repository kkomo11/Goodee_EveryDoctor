package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.drug.delivery.DrugDeliveryVO;
import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisPager;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;

@Mapper
public interface DrugPrescriptionMapper {

//	public List<DrugPrescriptionVO> findDrugPrescriptionSection() throws Exception;
//
//	public List<DrugPrescriptionVO> findDrugPrescriptionCategory() throws Exception;

	public DrugPrescriptionVO findDrugPrescriptionDetail() throws Exception;

	public List<DrugPrescriptionVO> findDrugPrescriptionList() throws Exception;
	
	public List<DrugPrescriptionVO> findDrugDeliveryNum()throws Exception;
	
	public Long findCompletedListCount(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception;

	public List<FileVO> findFile(HospitalDiagnosisVO hospitalDiagnosisVO) throws Exception;
	
	public List<HospitalDiagnosisVO> findCompletedList(HospitalDiagnosisPager hospitalDiagnosisPager) throws Exception;
	
}
