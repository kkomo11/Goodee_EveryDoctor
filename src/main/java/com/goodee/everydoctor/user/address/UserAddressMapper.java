package com.goodee.everydoctor.user.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface UserAddressMapper {

	public int insertUserAddress(UserAddressVO userAddressVO)throws Exception;
	public List<UserAddressVO> getUserAddressbyUsername(UserVO userVO)throws Exception;
}
