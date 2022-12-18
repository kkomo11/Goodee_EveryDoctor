package com.goodee.everydoctor.hospital.diagnosis;

import com.goodee.everydoctor.util.Pager;

import lombok.Data;

@Data
public class HospitalDiagnosisPager extends Pager {

	private String username;
	private Long perPage;
	
	public Long getPerPage() {
		return 5L;
	}
}
