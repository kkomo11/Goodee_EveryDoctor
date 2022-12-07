package com.goodee.everydoctor.hospital.doctor;

import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.hospital.HospitalSectionVO;
import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class HospitalDoctorVO {

	private UserVO userVO;
	private AgencyVO agencyVO;
	private HospitalSectionVO hospitalSectionVO;
}
