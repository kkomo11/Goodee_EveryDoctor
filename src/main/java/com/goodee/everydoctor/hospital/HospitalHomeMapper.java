package com.goodee.everydoctor.hospital;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HospitalHomeMapper {

	public List<HospitalSectionVO> findHospitalSection() throws Exception;
	public List<HospitalCategoryVO> findHospitalCategory() throws Exception;
}
