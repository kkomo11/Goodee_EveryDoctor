package com.goodee.everydoctor.chatting;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template;
	
	//Client가 SEND할 수 있는 경로
	//stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
	//"/pub/chat/enter"
	@MessageMapping(value = "/chat/enter")
	public void enter(ChatMessageVO message){
	    message.setMessage(message.getWriter() + "님이 채팅방에 참여하였습니다.");
	    template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
	}
	
	@MessageMapping(value = "/chat/message")
	public void message(ChatMessageVO message){
	    template.convertAndSend("/sub/chat/room/" + message.getRoomId(), message);
	}
}
