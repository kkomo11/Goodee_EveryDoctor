package com.goodee.everydoctor.user;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class UserService {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Value("${import.api.key}")
	private String apiKey;
	@Value("${import.api.secret}")
	private String apiSecret;
	
	
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
	
	public int certification(String imp_uid, UserVO userVO) throws Exception{
		IamportClient client = new IamportClient(apiKey,apiSecret);
		log.info("아임포트 key {}   secret {}", apiKey, apiSecret);

		IamportResponse<Certification> certification_response = client.certificationByImpUid(imp_uid);
		Certification res = certification_response.getResponse();
		log.info("NAME {}   GENDER {}   PHONE {}     BIRTH {}   UIQUEKEY {}",certification_response.getResponse().getName(), certification_response.getResponse().getGender(), certification_response.getResponse().getPhone(), certification_response.getResponse().getBirth(), certification_response.getResponse().getUniqueKey());
        
        Calendar birth = Calendar.getInstance();
        birth.setTime(certification_response.getResponse().getBirth());
        
        log.info("YEAR {}      MONTH {}        DATE {}",birth.get(birth.YEAR),birth.get(birth.MONTH)+1, birth.get(birth.DAY_OF_MONTH));
		
		log.info("{}", birth.get(birth.YEAR)*10000 + (birth.get(birth.MONTH)+1)*100 + birth.get(birth.DAY_OF_MONTH));
		
		
		userVO.setPhone(res.getPhone());
		userVO.setName(res.getName());
		userVO.setCi(res.getUniqueKey());;
		userVO.setBirth(birth.get(birth.YEAR)*10000 + (birth.get(birth.MONTH)+1)*100 + birth.get(birth.DAY_OF_MONTH));
		
		int result = userMapper.modifyUserMember(userVO);
		result = userMapper.modifyRoleMember(userVO);
		
		return result;
	}
}
