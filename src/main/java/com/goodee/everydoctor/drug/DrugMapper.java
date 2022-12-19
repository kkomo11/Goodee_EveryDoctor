package com.goodee.everydoctor.drug;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.util.Pager;

@Mapper
public interface DrugMapper {

	public List<DrugVO> findDrugList(Pager pager)throws Exception;
	
	public List<DrugVO> findDrugListAll()throws Exception;

	public DrugVO findDrugDetail(DrugVO drugVO)throws Exception;

	public Long	findDrugTotalCount(Pager pager) throws Exception;

	public List<DrugVO> findDrugStore(Pager pager) throws Exception;
}
