package com.goodee.everydoctor.user.address;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.goodee.everydoctor.user.UserVO;

@Mapper
public interface UserAddressMapper {

	// 주소 입력
	public int insertUserAddress(UserAddressVO userAddressVO)throws Exception;
	// 주소 여러개 전부다 꺼낼때
	public List<UserAddressVO> getUserAddressbyUsername(UserVO userVO)throws Exception;
	// 주소 한개 가져올 때
	public UserAddressVO getOneUserAddressbyUsername(UserAddressVO userAddressVO)throws Exception;
	
}
