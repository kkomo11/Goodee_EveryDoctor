package com.goodee.everydoctor.user;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.util.FileManager;
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
	@Autowired
	private FileManager fileManager;
	
	
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

		IamportResponse<Certification> certification_response = client.certificationByImpUid(imp_uid);
		Certification res = certification_response.getResponse();

		userVO.setCi(res.getUniqueKey());
		//중복가입 확인
		int cntCi=userMapper.hasUserByCI(userVO);
		
		if(cntCi>0) { //가입자가 0초과면 아래코드를 실행하지 않고 0을 리턴한다.
			return 0;
		}
		
		
        Calendar birth = Calendar.getInstance();
        birth.setTime(certification_response.getResponse().getBirth());

		userVO.setPhone(res.getPhone());
		userVO.setName(res.getName());
		userVO.setBirth(birth.get(birth.YEAR)*10000 + (birth.get(birth.MONTH)+1)*100 + birth.get(birth.DAY_OF_MONTH));
		
		int result = userMapper.modifyUserMember(userVO);
		result = userMapper.modifyRoleMember(userVO);
		
		userVO= userMapper.getUserByUsername(userVO.getUsername());
		
		return result;
	}
	
	public int profileUpload(MultipartFile file, String username) throws Exception{
		
		//기존 폴더 삭제
		FileVO fileVO = new FileVO();
		
		fileVO.setLabel("user");
		fileVO.setFileName(username);
		
		boolean result = fileManager.deleteFile(fileVO);
		
		log.info("result {}", result);
		
		
		//새로운 폴더 생성해 파일 넣기
		String filename = fileManager.saveFile(file, "user/"+username);
		
		//DB에 파일 저장
		UserVO userVO = new UserVO();
		
		userVO.setUsername(username);
		userVO.setFileName("/file/user/"+username+"/"+filename);
		
		int result2 = userMapper.modifyFileName(userVO);
		
		
		return result2;
	}
}
