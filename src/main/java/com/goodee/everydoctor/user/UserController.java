package com.goodee.everydoctor.user;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("user")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	
	//테스트 메서드
	@GetMapping("login")
	public void getLogin() {
		
	}
	
	//회원가입 GET
	@GetMapping("registration")
	public void registration(@ModelAttribute UserVO userVO) {
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
				mv.setViewName("user/login");
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
	public void certification(String imp_uid, String name, String gender)throws Exception{
		log.info("certification {} Name {} gender {}",imp_uid, name, gender);
	}

}
