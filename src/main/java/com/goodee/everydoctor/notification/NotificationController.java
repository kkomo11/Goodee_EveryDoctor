package com.goodee.everydoctor.notification;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.goodee.everydoctor.user.UserVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NotificationController {
	
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping(value="/subscribe/{id}", produces="text/event-stream")
	public SseEmitter subscribe(@AuthenticationPrincipal UserVO userVO,
							   @RequestHeader(value="Last-Event-ID", required=false,defaultValue = "") String lastEventId) {
	
		return notificationService.subscribe(userVO.getUsername(),lastEventId);
	}

}
