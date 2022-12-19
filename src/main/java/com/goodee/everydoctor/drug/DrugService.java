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

	public List<DrugVO> findDrugList(Pager pager)throws Exception {
		// TODO Auto-generated method stub
		Long drugTotalCount = drugMapper.findDrugTotalCount(pager); //페이지토탈
		pager.getRowNum();
		pager.getNum(drugTotalCount);
		return drugMapper.findDrugList(pager);
	}
	
	public List<DrugVO> findDrugListAll()throws Exception {
		// TODO Auto-generated method stub
		return drugMapper.findDrugListAll();
	}


	public DrugVO findDrugDetail(DrugVO drugVO)throws Exception {
		// TODO Auto-generated method stub
		return drugMapper.findDrugDetail(drugVO);
	}
	
	//약국
	public List<DrugVO> findDrugStroe(Pager pager)throws Exception {
		Long drugTotalCount = drugMapper.findDrugTotalCount(pager);
		pager.getRowNum();
		pager.getNum(drugTotalCount);
		return drugMapper.findDrugStore(pager);
	}

}
