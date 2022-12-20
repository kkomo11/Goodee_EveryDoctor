package com.goodee.everydoctor.hospital.diagnosis;

import lombok.Data;

@Data
public class HospitalPrescriptionVO {

	private Long prescriptionNum;
	private Long dansNum;
	private Integer prescriptionStatus;
	private String pharmacist;
}
