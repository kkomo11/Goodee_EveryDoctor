package com.goodee.everydoctor.drug.delivery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DrugDeliveryMapper {
	
	public List<DrugDeliveryVO> findDrugDeliveryList(DrugDeliveryVO drugDeliveryVO)throws Exception;

	public DrugDeliveryVO findDrugDeliveryDetail(DrugDeliveryVO drugDeliveryVO)throws Exception;

	public int setDrugDeliveryIcon(DrugDeliveryVO drugDeliveryVO)throws Exception;
	
}
