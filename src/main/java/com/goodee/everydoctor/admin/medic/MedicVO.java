package com.goodee.everydoctor.admin.medic;

import java.util.List;

import com.goodee.everydoctor.admin.agency.AgencyVO;
import com.goodee.everydoctor.user.UserVO;

import lombok.Data;

@Data
public class MedicVO {
	
	private String username;
	private int agencyNum;
	private String medicInfo;
	private int medicEnabled;
	private String medicRole;
	private String medicSpecialty;
	
	private AgencyVO agencyVO;
	private UserVO userVO;
	private Integer [] sectionNums;
	

}
