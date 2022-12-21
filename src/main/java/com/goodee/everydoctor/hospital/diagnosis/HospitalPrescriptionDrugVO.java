
package com.goodee.everydoctor.hospital.diagnosis;

import lombok.Data;

@Data
public class HospitalPrescriptionDrugVO {

	private Long prescriptionDrugNum;
	private Long prescriptionNum;
	private Long drugNum;
	private Integer dose;
	private Integer doseHit;
	private Integer doseDays;
}
