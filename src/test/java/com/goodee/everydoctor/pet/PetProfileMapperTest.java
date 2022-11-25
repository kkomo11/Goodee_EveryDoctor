package com.goodee.everydoctor.pet;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.util.Calendar;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.goodee.everydoctor.pet.profile.PetProfileService;
import com.goodee.everydoctor.pet.profile.PetVO;

@SpringBootTest
class PetProfileMapperTest {

	@Autowired
	private PetProfileService petProfileService;
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}
	
	//@Test
	void inputProfileTest() throws Exception {
		PetVO petVO = new PetVO();
		petVO.setUserName("test");
		petVO.setPetBioNum(11L);
		petVO.setPetName("뽀삐");
		petVO.setNeutered(1);
		petVO.setPetAge(2);
		petVO.setPetSex(0);
		petVO.setVaccinnation(1);
		petVO.setPetBirth(new Date(Calendar.getInstance().getTimeInMillis()));
		
		//int result = petProfileService.inputPetProfile(petVO);
		
		//assertEquals(1, result);
	}

}
