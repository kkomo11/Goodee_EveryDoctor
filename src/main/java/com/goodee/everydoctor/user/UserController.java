package com.goodee.everydoctor.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.sse.NotificationController;
import com.goodee.everydoctor.user.address.UserAddressVO;
import com.goodee.everydoctor.user.security.LogoutHandlerImpl;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("user")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private LogoutHandlerImpl logoutHandlerImpl;
	@Autowired
	private NotificationController notificationController;
	
	//테스트 메서드
	@GetMapping("login")
	public void getLogin() {
		
	}
	
	@GetMapping("chkId")
	@ResponseBody
	public int chkId(String username)throws Exception{
		log.info("유저네임 {}", username);
		return userService.chkId(username);
	}
	
	//회원가입 GET
	@GetMapping("registration")
	public void registration(@ModelAttribute UserVO userVO) {
		
//		notificationController.dispatchEventToClients(" 우앙 ","우다다다닥","", "Doctor");
	}
	
	//일반 회원가입 처리 
	@PostMapping("registration")
	public ModelAndView registration(@Valid UserVO userVO, BindingResult bindingResult, ModelAndView mv, String agree_all) throws Exception{
		log.info("regi {} ", userVO);
		
		if(agree_all.equals("on")) {
			boolean chk = bindingResult.hasErrors();
			
			if(chk) {
				mv.setViewName("user/registration");
			}else {
				int result = userService.inputUser(userVO);
				mv.setViewName("redirect:/user/login");
			}
		}else {
			//js처리 필요
			mv.setViewName("user/registration");
			mv.addObject("agree_msg", "이용약관 전체 동의해주세요");
		}
		
		
		return mv;
	}
	
	//본인인증 처리
	@PostMapping("certification")
	@ResponseBody
	public int certification(String imp_uid,@AuthenticationPrincipal UserVO userVO, HttpSession session)throws Exception{
		
		// 중복 가입 확인 및 본인인증 처리	
		int result = userService.certification(imp_uid, userVO);
		
		//세션 만료
		session.invalidate();
		
		return result;
	}
	
	@GetMapping("profile")
	public String getProfile()throws Exception{
		return "user/profile";
	}
	
	@PostMapping("profileImgUpload")
	@ResponseBody
	public int profileImgUpload(MultipartFile file, String username, HttpSession session) throws Exception{
		log.info("!file {} path {}", file, username);
		int result = userService.profileImgUpload(file, username);
		
		if(result == 1) {
			session.invalidate();
		}
		
		return result;
	}
	
	@PostMapping("setProfileImgDefault")
	@ResponseBody
	public int setProfileImgDefault(UserVO userVO, HttpSession session) throws Exception{
		log.info("!username	 {}", userVO.getUsername());
		int result = userService.setProfileImgDefault(userVO);
		
		if(result == 1) {
			session.invalidate();
		}
		
		return result;
	}
	
	@GetMapping("phoneCheck")
	@ResponseBody
	public int phoneCheck(String phonenum)throws Exception{
		int randomNumber = (int)(Math.random()*1000000);
		
		int result = userService.phoneCheck(phonenum, randomNumber);
		
		if(result==1) {
			result = randomNumber;			
		}
		
		return result;
	}
	
	@GetMapping("emailCheck")
	@ResponseBody
	public int emailCheck(String emailnum)throws Exception{
		int randomNumber = (int)(Math.random()*1000000);
		
		int result = userService.emailCheck(emailnum, randomNumber);
		
		if(result==1) {
			result = randomNumber;			
		}
		
		return result;
	}
	
	@PostMapping("modifyProfile")
	@ResponseBody
	public int modifyProfile(@AuthenticationPrincipal UserVO userVO, String phoneNum, String emailNum, HttpSession session) throws Exception{
		int result = 0;
		
		if(emailNum.equals("")) {
			log.info("폰변경");
			result = userService.modifyPhone(userVO, phoneNum);
		}else if(phoneNum.equals("")) {
			log.info("이메일 변경");
			result = userService.modifyEmail(userVO, emailNum);
		}
		
		if(result==1) {
			session.invalidate();
		}
		return result;
	}
	
	@PostMapping("modifyPassword")
	@ResponseBody
	public int modifyPassword(HttpServletRequest request, HttpServletResponse response, Authentication authentication,UserVO userVO, String newPassword, String retypePassword, String currentPassword)throws Exception{
		log.info("{} modifyPassword {} {} {}",userVO.getUsername(), newPassword, retypePassword, currentPassword);
		
		int result = userService.modifyPassword(userVO, newPassword, retypePassword, currentPassword);
		if(result==1) {
			logoutHandlerImpl.logout(request, response, authentication);
		}
		return result;
	}
	
	@GetMapping("dashboard")
	public String getDashboard() throws Exception{
		return "user/dashboard";
	}
	
	@GetMapping("address")
	public ModelAndView address(ModelAndView mv, @AuthenticationPrincipal UserVO userVO) throws Exception{
		
		//기존 주소 가져와서 돌려주기
		List<UserAddressVO>	userAddressVOs = userService.getAddressList(userVO);
		mv.addObject("listAddress", userAddressVOs);
		mv.setViewName("/user/address");
		
		return mv;
	}
	
	@GetMapping("oneAddress")
	public void oneAddress( UserAddressVO userAddressVO) throws Exception{

		
	}
	
	@PostMapping("address")
	public String address(@AuthenticationPrincipal UserVO userVO, UserAddressVO addressVO) throws Exception{
		//주소 저장하기
		addressVO.setUsername(userVO.getUsername());
		int result = userService.insertAddress(addressVO);
		
		log.info("어드레스{}", addressVO);	
		
		return "redirect:/user/address";
		
	}

}
