package com.goodee.everydoctor.admin.agency;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AgencyVO {

	private int agencyNum;
	@NotBlank
	private String agencyName;
	@NotBlank
	private String agencyAddr;
	@NotBlank
	private String agencyTel;
	private String agencyInfo;
	private String agencyRole;
	private String agencyType;
}
