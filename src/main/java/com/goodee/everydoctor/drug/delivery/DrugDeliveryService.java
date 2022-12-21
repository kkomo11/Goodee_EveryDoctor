package com.goodee.everydoctor.drug.delivery;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class DrugDeliveryService {

	@Autowired
	private DrugDeliveryMapper drugDeliveryMapper;
	
	@Value("${app.file.base}")
	private String path;
	
	public List<DrugDeliveryVO> findDrugDeliveryList(DrugDeliveryVO drugDeliveryVO) throws Exception {
		
		return drugDeliveryMapper.findDrugDeliveryList(drugDeliveryVO);
	}

	public  List<DrugDeliveryVO> findDrugDeliveryNum(DrugDeliveryVO drugDeliveryVO)throws Exception {
		
		return drugDeliveryMapper.findDrugDeliveryNum(drugDeliveryVO);
	}
		
}
