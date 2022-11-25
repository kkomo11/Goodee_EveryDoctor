package com.goodee.everydoctor.drugDelivery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DrugDeliveryMapper {
	
	public List<DrugDeliveryVO> getList(DrugDeliveryVO drugDeliveryVO)throws Exception;
	
}
