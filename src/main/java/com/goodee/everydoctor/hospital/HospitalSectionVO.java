package com.goodee.everydoctor.hospital;

import lombok.Data;

@Data
public class HospitalSectionVO {

	private Integer sectionNum;
	private String sectionName;
	private boolean sectionKind;
	private String sectionIcon;
	
	public Integer getSectionNum() {
		
		if(this.sectionNum == null || this.sectionNum < 1 || this.sectionNum > 17) {
			this.sectionNum = 0;
		}
		return this.sectionNum;
	}
}
