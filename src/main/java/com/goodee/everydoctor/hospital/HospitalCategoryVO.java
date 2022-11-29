package com.goodee.everydoctor.hospital;

import lombok.Data;

@Data
public class HospitalCategoryVO {

	private Integer categoryNum;
	private String categoryName;
	private boolean categoryKind;
	private Integer categoryNumRef;
	private String categoryIcon;
}
