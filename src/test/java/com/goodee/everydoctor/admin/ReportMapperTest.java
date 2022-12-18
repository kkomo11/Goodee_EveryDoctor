package com.goodee.everydoctor.admin;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.web.WebAppConfiguration;

import com.goodee.everydoctor.user.UserMapper;
import com.goodee.everydoctor.user.UserService;
import com.goodee.everydoctor.user.UserVO;

@SpringBootTest
@WebAppConfiguration
class ReportMapperTest {
	@Autowired
	private UserService userService;

//	@Test
	void inputUsertest()throws Exception {
		for(int i = 10; i <=10; i++) {
			
			UserVO userVO = new UserVO();
			userVO.setUsername("ddoctor" + i);
			userVO.setPassword("pharmacist" + i);
			userVO.setName("pharmacist" + i);
			int result = userService.inputUser(userVO);
			assertNotEquals(0, result);
		}
	}

}
