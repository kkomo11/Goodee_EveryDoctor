package com.goodee.everydoctor.user;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.goodee.everydoctor.file.FileVO;
import com.goodee.everydoctor.user.address.UserAddressMapper;
import com.goodee.everydoctor.user.address.UserAddressVO;
import com.goodee.everydoctor.user.security.LogoutHandlerImpl;
import com.goodee.everydoctor.util.EmailManager;
import com.goodee.everydoctor.util.FileManager;
import com.goodee.everydoctor.util.MessageManager;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.Certification;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

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
	@Autowired
	private MessageManager messageManager;
	@Autowired
	private EmailManager emailManager;
	@Autowired
	private UserAddressMapper addressMapper;
	
	public int chkId(String username)throws Exception{
		return userMapper.chkId(username);
	}
	
	
	public int inputUser(UserVO userVO)throws Exception{
		//비밀번호 암호화
		userVO.setPassword(passwordEncoder.encode(userVO.getPassword()));
		userVO.setFileName("/images/defaultProfile.png");
		
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
//		int cntCi=userMapper.hasUserByCI(userVO);
//		
//		if(cntCi>0) { //가입자가 0초과면 아래코드를 실행하지 않고 0을 리턴한다.
//			return 0;
//		}
		
		
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
	
	public int profileImgUpload(MultipartFile file, String username) throws Exception{
		
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
	
	public int setProfileImgDefault(UserVO userVO)throws Exception{
		//기존 폴더 삭제
		FileVO fileVO = new FileVO();
		
		fileVO.setLabel("user");
		fileVO.setFileName(userVO.getUsername());
		
		boolean result = fileManager.deleteFile(fileVO);
				
		log.info("result {}", result);
		
		//DB에 파일위치 default로 변경
		userVO.setFileName("/images/defaultProfile.png");
		
		int result2 = userMapper.modifyFileName(userVO);
				
		
		return result2;
	}
	
	public int phoneCheck(String userPhoneNumber, int radomNumber) {
		
		SingleMessageSentResponse res = messageManager.sendOne("01075378627", userPhoneNumber, "[EveryDoctor] 인증번호는" + "["+ radomNumber+"]" + "입니다.");

		log.info("res {}", res);
		
		if(res.getStatusCode().equals("2000")||res.getStatusCode().equals("3000")||res.getStatusCode().equals("4000")) {
			return 1;
		}
		return 0;
	}
	
	public int emailCheck(String userEmail, int radomNumber) {
		
		emailManager.sendHTML(userEmail, "[EVERYDOCTOR] 이메일 변경 인증 코드", "에브리닥터의 인증코드는 ["+radomNumber+"] 입니다.");
		
		return 1;
	}
	
	public int modifyPhone(UserVO userVO, String phone)throws Exception{
		
		userVO.setPhone(phone);
		
		int result = userMapper.modifyPhone(userVO);
		return result;
	}
	
	public int modifyEmail(UserVO userVO, String email)throws Exception{
		
		userVO.setEmail(email);
		int result = userMapper.modifyEmail(userVO);
		
		return result;
	}
	
	public int modifyPassword( UserVO userVO, String newPassword, String retypePassword, String currentPassword) throws Exception{
		//비번 동일한지 확인
		UserVO chkUser = userMapper.getUserByUsername(userVO.getUsername());
		boolean chkPw = passwordEncoder.matches(currentPassword, chkUser.getPassword());
		
		int result=0;
		//동일하면 비번 변경
		if(chkPw && newPassword.equals(retypePassword)) {
			userVO.setPassword(passwordEncoder.encode(newPassword));
			result = userMapper.modifyPassword(userVO);
		}
		
		return result;
	}
	
	public int insertAddress(UserAddressVO userAddressVO)throws Exception{
		
		int result = addressMapper.insertUserAddress(userAddressVO);
		
		return result;
	}
	
	public List<UserAddressVO> getAddress(UserVO userVO)throws Exception{
		return addressMapper.getUserAddressbyUsername(userVO);
	}
}
