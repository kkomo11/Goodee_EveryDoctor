package com.goodee.everydoctor.drug;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.goodee.everydoctor.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class DrugService {
	@Autowired
	private DrugMapper drugMapper;

	public List<DrugVO> getList(Pager pager)throws Exception {
		// TODO Auto-generated method stub
		Long drugTotalCount = drugMapper.getDrugTotalCount(); //페이지토탈
		pager.getRowNum();
		pager.getNum(drugTotalCount);
		return drugMapper.getList(pager);
	}

	public DrugVO getDetail(DrugVO drugVO)throws Exception {
		// TODO Auto-generated method stub
		return drugMapper.getDetail(drugVO);
	}

}
