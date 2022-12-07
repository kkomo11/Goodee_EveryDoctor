package com.goodee.everydoctor.admin.agency;

import lombok.Data;

@Data
public class AgencyWorkHourVO {
	
	private int agencyNum;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	private String holiday;
	private String lunch;

}
