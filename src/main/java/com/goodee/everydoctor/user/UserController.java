package com.goodee.everydoctor.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	@ResponseBody
	public int certification(String imp_uid, UserVO userVO, HttpSession session)throws Exception{
		
		int result = userService.certification(imp_uid, userVO);
		
		//1이돌아오면 등급이 바뀌므로 authentication을 다시줘서 리턴
		SecurityContext context = (SecurityContext)session.getAttribute("SPRING_SECURITY_CONTEXT");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth!=null) {			
			log.info("obj => {}", ((UserVO)(auth.getPrincipal())).getRoles().get(0));
		}
		
		List<GrantedAuthority> newAuthority = new ArrayList<>();
		newAuthority.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				// TODO Auto-generated method stub
				return "ROLE_MEMBER";
			}
		});
		
		log.info("authority {}", newAuthority.get(0));
		

		Authentication newAuth = new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), newAuthority);
		
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		context.setAuthentication(newAuth);
		session.setAttribute("SPRING_SECURITY_CONTEXT", context);
		
		return result;
	}

}
