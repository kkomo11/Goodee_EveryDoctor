package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DrugPrescriptionService {

	@Autowired
	private DrugPrescriptionMapper drugPrescriptionMapper;

	public List<DrugPrescriptionVO> findDrugPrecriptionSection()throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.findDrugPrescriptionSection();
	}

	public List<DrugPrescriptionVO> findDrugPrescriptionCategory()throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.findDrugPrescriptionCategory();
	}

	public DrugPrescriptionVO getDetail()throws Exception {
		// TODO Auto-generated method stub
		return  drugPrescriptionMapper.getDetail();
	}

	public List<DrugPrescriptionVO> getList()throws Exception {
		// TODO Auto-generated method stub
		return drugPrescriptionMapper.getList();
	}


}