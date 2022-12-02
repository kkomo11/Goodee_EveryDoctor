package com.goodee.everydoctor.drug.prescription;

import lombok.Data;

@Data
public class DrugPrescriptionVO {
	
	private Integer categoryNum;
	//환자 증상명
	private String categoryName;
	//진료 과목명
	private String sectionName;

}
