package com.goodee.everydoctor.hospital.doctor;

import java.util.List;

import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.hospital.HospitalSectionVO;
import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class HospitalDoctorVO extends UserVO {

	private AgencyVO agencyVO;
	private MedicVO medicVO;
	private List<HospitalSectionVO> hospitalSectionVOs;
}
