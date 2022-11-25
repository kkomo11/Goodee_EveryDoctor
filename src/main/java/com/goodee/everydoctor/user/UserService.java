package com.goodee.everydoctor.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int inputUser(UserVO userVO)throws Exception{
		//비밀번호 암호화
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		
		int result = userMapper.inputUser(userVO);
		if(result==1) {
			result = userMapper.inputRolePre(userVO);
		}else {
			throw new Exception("user DB insert error");
		}
		
		return result;
	}
}
