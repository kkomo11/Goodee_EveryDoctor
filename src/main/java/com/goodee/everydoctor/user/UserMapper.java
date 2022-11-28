package com.goodee.everydoctor.user;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

@Mapper
public interface UserMapper {

	public int inputUser(UserVO userVO) throws Exception;
	public int inputRolePre(UserVO userVO)throws Exception;
	public UserVO getUserByUsername(String username)throws UsernameNotFoundException;
}