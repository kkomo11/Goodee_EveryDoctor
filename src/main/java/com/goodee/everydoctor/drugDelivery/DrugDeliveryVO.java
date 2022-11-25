package com.goodee.everydoctor.drugDelivery;

import lombok.Data;

@Data
public class DrugDeliveryVO {
	
	//배송번호(운송장번호)
	private Long drugDeliveryNum;
	//주문번호
	private Long payNum;
}
