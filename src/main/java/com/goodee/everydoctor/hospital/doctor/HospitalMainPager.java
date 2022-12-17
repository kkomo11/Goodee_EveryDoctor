package com.goodee.everydoctor.hospital.doctor;

import com.goodee.everydoctor.util.Pager;

import lombok.Data;

@Data
public class HospitalMainPager extends Pager{

	private Integer sectionNum;
	private Long perPage;
	private Long perBlock;
	
	public HospitalMainPager() {
		this.perPage=9L;
		this.perBlock=5L;
	}
	
	public Long getPerPage() {
		if(this.perPage==null) {
			this.perPage=9L;
		}
		return perPage;
	}
}
