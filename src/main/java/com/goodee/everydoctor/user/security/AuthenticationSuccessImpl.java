package com.goodee.everydoctor.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthenticationSuccessImpl implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("==LoginSuccessHandler==");
		
		//rememberID
		String rememberId = request.getParameter("rememberId");
		
		log.info("rememberID {}", rememberId);
		
		if(rememberId!=null) {
			Cookie cookie = new Cookie("rememberUN", request.getParameter("username"));
			cookie.setMaxAge(60*60*24*7);
			cookie.setPath("/user/login");
			cookie.setHttpOnly(true);
			response.addCookie(cookie);
		}else {
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("rememberUN")) {
					cookie.setMaxAge(0);
					cookie.setPath("/user/login");
					response.addCookie(cookie);
				}
			}
		}
	
		
		response.sendRedirect("/");
	}
	
	

}
