package com.goodee.everydoctor.consult.answer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConsultAnswerMapper {
	
	public Long findConsultAnswerCount(ConsultAnswerVO consultAnswerVO) throws Exception;
	
	public List<ConsultAnswerVO> findConsultAnswer(ConsultAnswerPager consultAnswerPager) throws Exception;
	
	public int inputConsultAnswer(ConsultAnswerVO consultAnswerVO) throws Exception;

}
