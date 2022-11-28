package com.goodee.everydoctor.drugDelivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class DrugDeliveryService {

	@Autowired
	private DrugDeliveryMapper drugDeliveryMapper;
	
	public List<DrugDeliveryVO> getList(DrugDeliveryVO drugDeliveryVO)throws Exception {
		return drugDeliveryMapper.getList(drugDeliveryVO);
	}
}