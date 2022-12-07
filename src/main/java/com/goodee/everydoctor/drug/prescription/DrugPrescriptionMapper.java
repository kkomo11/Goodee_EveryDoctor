package com.goodee.everydoctor.drug.prescription;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DrugPrescriptionMapper {

	public List<DrugPrescriptionVO> findDrugPrescriptionSection() throws Exception;

	public List<DrugPrescriptionVO> findDrugPrescriptionCategory() throws Exception;

	public DrugPrescriptionVO findDrugPrescriptionDetail() throws Exception;

	public List<DrugPrescriptionVO> findDrugPrescriptionList() throws Exception;
}
