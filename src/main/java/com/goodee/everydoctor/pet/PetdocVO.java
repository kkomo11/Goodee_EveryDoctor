package com.goodee.everydoctor.pet;

import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.admin.medic.MedicVO;
import com.goodee.everydoctor.hospital.HospitalSectionVO;
import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class PetdocVO {

	private UserVO userVO;
	private MedicVO medicVO;
	private AgencyVO agencyVO;
	private HospitalSectionVO hospitalSectionVO;
	
}
