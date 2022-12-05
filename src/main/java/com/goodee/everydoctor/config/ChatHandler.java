package com.goodee.everydoctor.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ChatHandler extends TextWebSocketHandler{
	
	private static List<WebSocketSession> list = new ArrayList<>();

	// message
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//websocket을 통해서 받은 메세지를 처리하는 메서드
		String payload = message.getPayload();
        log.info("payload : " + payload);

        for(WebSocketSession sess: list) {
            sess.sendMessage(message);
        }
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//websocket에 session이 접속했을 때 처리하는 메서드
		list.add(session);

        log.info(session + " 클라이언트 접속");
	}
	
	// connection closed
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//websocket에 session이 접속을 해제 했을 때 처리하는 메서드
		log.info(session + " 클라이언트 접속 해제");
        list.remove(session);
	}
}
