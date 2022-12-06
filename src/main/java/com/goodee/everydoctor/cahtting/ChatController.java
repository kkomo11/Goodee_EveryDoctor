package com.goodee.everydoctor.cahtting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.goodee.everydoctor.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
//@RequestMapping("/chatting/*")
public class ChatController {

	@GetMapping("/chat")
	public String getChat(Model model) {
		
		UserVO user = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		model.addAttribute("user", user);
	return "thymeleaf/chat";
	}

}
