package com.goodee.everydoctor.consult;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.hospital.HospitalCategoryVO;
import com.goodee.everydoctor.util.Pager;

@Mapper
public interface ConsultMapper {
	
	public int deleteConsult(ConsultVO consultVO) throws Exception;	//delete
	
	public List<FileVO> findConsultFiles(ConsultVO consultVO) throws Exception;	//update, List
	
	public int deleteConsultCategory(ConsultVO consultVO) throws Exception;	//update, delete
	
	public int modifyConsult(ConsultVO consultVO) throws Exception;	//update
	
	public ConsultVO findConsultDetail(ConsultVO consultVO) throws Exception;	//detail, update
	
	public int inputConsultCategory(ConsultVO consultVO) throws Exception;	//input
	
	public int inputConsult(ConsultVO consultVO) throws Exception;	//input
	
	public List<HospitalCategoryVO> findConsultCategory(ConsultVO consultVO) throws Exception;	//input
	
	public List<FileVO> findFile(ConsultVO consultVO) throws Exception;		// list
	
	public List<ConsultVO> findConsultList(Pager pager) throws Exception;	// list
	
	public Long findConsultCount(Pager pager) throws Exception;	// list
	
	public List<HospitalCategoryVO> findAllCategories() throws Exception;

}
