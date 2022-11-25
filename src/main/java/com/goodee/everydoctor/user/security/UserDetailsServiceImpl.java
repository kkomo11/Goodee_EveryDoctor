package com.goodee.everydoctor.user.security;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.goodee.everydoctor.user.UserMapper;
import com.goodee.everydoctor.user.UserService;
import com.goodee.everydoctor.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserDetailsServiceImpl extends DefaultOAuth2UserService implements UserDetailsService{
	
	@Autowired
	private UserMapper userMapper;	
	
	//일반로그인 처리하는 메서드
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("====UserDetailsService loadUserByUsername=====");
		UserVO userVO = userMapper.getUserByUsername(username);

		log.info("userVO {}", userVO);
		return userVO;
	}
	
	//소셜로그인 
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		log.info("================== social Login 시도 ==================");
		//리프레시 토큰 만료시간(getAdditionalParameters) :  5183999

		//kakao인지 네이버인지 구글인지에 따라 , 형식이 조금씩 다르므로 각각 메서드를 만든다.
		String social = userRequest.getClientRegistration().getRegistrationId();
		log.info("social의 이름은 뭐냐 {}",social);
		
		OAuth2User auth2User = super.loadUser(userRequest);
		
		//회원가입 유무를 판별하고 로그인 처리
		if(social.equals("kakao")) {
			auth2User = this.kakaoJoinCheck(auth2User);
		}
		
		return auth2User;
	}
		
	//회원가입 유무 판별하기
	//회원가입 유무를 판별한다.
	private OAuth2User kakaoJoinCheck(OAuth2User auth2User)throws OAuth2AuthenticationException{
		log.info("-------------------사용자 정보-----------------");
		String userName = "kakao@"+auth2User.getName(); //사용자의 고유id

		//properties를 꺼내쓰려고 하는데 무슨 타입일까?
		log.info("ClassName : {}", auth2User.getAttribute("kakao_account").getClass().toString());
		
		UserVO userVO;
		userVO = userMapper.getUserByUsername(userName);
		
		if(userVO==null) {
			//새로운 userVO 세팅해서 회원가입
			userVO = new UserVO();
			
			LinkedHashMap<String, String> properties = auth2User.getAttribute("properties");
			Map<String, Object> ka = auth2User.getAttribute("kakao_account");
			userVO.setUsername(userName);
			userVO.setPassword(userName);
			userVO.setNickname(properties.get("nickname"));
			userVO.setFileName(properties.get("profile_image"));
			userVO.setEmail(ka.get("email").toString());
			
			int result;
			try {
				result = userMapper.inputUser(userVO);
				if(result == 1) {
					result = userMapper.inputRolePre(userVO);
				}else {
					log.info("userVO DB저장 실패");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//카카오 회원가입 완료
		
		//로그인
		auth2User = userMapper.getUserByUsername(userName);
		
		return auth2User;
	}

}
