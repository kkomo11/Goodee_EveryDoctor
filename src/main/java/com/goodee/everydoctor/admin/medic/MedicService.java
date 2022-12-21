package com.goodee.everydoctor.admin.medic;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MedicService {

	@Autowired
	private MedicMapper medicMapper;

	//종사자 정보 등록
	public int inputMedic(MedicVO medicVO)throws Exception{
		int inputSectionResult = 1;
		int inputResult = 0;
		String username = medicVO.getUsername();
		log.info("========= MedicService 실행 ========");
		log.info("UserName확인 : {}", medicVO.getUsername());
		List<Integer> medicSectionResult = new ArrayList<>();
		MedicSectionVO medicSectionVO = new MedicSectionVO();
		for(Integer nums: medicVO.getSectionNums()) {
			medicSectionVO.setSectionNum(nums);
			medicSectionVO.setUsername(username);

			int result = medicMapper.inputMedicSection(medicSectionVO);
			medicSectionResult.add(result);
		}
		if(medicSectionResult.contains(0)) {
			inputSectionResult = 0;
		}
		int inputMedicResult = medicMapper.inputMedic(medicVO);
		if(inputSectionResult == 1 && inputMedicResult == 1) {
			inputResult = 1;
		}
		log.info("=========== MedicSection 인풋결과 : {}", inputResult);
		return inputResult;
	}

}
