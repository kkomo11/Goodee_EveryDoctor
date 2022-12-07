package com.goodee.everydoctor.consult.answer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConsultAnswerService {
	
	@Autowired
	private ConsultAnswerMapper consultAnswerMapper;
	
	public int deleteConsultAnswer(ConsultAnswerVO consultAnswerVO) throws Exception {
		return consultAnswerMapper.deleteConsultAnswer(consultAnswerVO);
	}
	
	public Long findConsultAnswerCount(ConsultAnswerVO consultAnswerVO) throws Exception{
		return consultAnswerMapper.findConsultAnswerCount(consultAnswerVO);
	}
	
	public List<ConsultAnswerVO> findConsultAnswer(ConsultAnswerPager consultAnswerPager) throws Exception{
		ConsultAnswerVO consultAnswerVO = new ConsultAnswerVO();
		consultAnswerVO.setConsultNum(consultAnswerPager.getConsultNum());
		Long totalCount = consultAnswerMapper.findConsultAnswerCount(consultAnswerVO);
		
		consultAnswerPager.getNum(totalCount);
		consultAnswerPager.getRowNum();
		
		return consultAnswerMapper.findConsultAnswer(consultAnswerPager);
	}
	
	public int inputConsultAnswer(ConsultAnswerVO consultAnswerVO) throws Exception {
		return consultAnswerMapper.inputConsultAnswer(consultAnswerVO);
	}

}
