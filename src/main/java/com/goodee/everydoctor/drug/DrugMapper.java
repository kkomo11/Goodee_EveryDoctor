package com.goodee.everydoctor.drug;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.util.Pager;

@Mapper
public interface DrugMapper {
	
	public List<DrugVO> getList(Pager pager)throws Exception;
	
	public DrugVO getDetail(DrugVO drugVO)throws Exception;

}
