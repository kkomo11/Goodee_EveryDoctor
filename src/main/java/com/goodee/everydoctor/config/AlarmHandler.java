package com.goodee.everydoctor.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.goodee.everydoctor.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AlarmHandler extends TextWebSocketHandler{

	//로그인 한 인원전체
	private List<WebSocketSession> sessions = new ArrayList<>();
	//1:1 할 경우
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String,WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		// TODO Auto-generated method stub
		log.info("Socket 연결");
		sessions.add(session);
		log.info(currentUserName(session));//현재 접속한 사람
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		// TODO Auto-generated method stub
		log.info("ssesion"+currentUserName(session));
		String msg = message.getPayload();//자바스크립트에서 넘어온 Msg
		log.info("msg="+msg);
		
		if (StringUtils.hasText(msg)) {
			log.info("if문 들어옴?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 5) {
				
				String cmd = strs[0];
				String client = strs[1];
				String doctor = strs[2];
				String dansnum = strs[3];
				String danscategory = strs[4];
//				String danscategory = strs[5];
				log.info("length 성공?"+cmd);
				
				WebSocketSession docterSession = userSessionsMap.get(client);
				WebSocketSession clientSession = userSessionsMap.get(doctor);
				log.info("boardWriterSession="+userSessionsMap.get(doctor));
				log.info("boardWirterSession"+clientSession);
				
				//댓글
				if ("reply".equals(cmd) && clientSession != null) {
					log.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(client + "님이 "
							+ "<a href='/board/readView?dansnum="+ dansnum +"&danscategory="+danscategory+"'  style=\"color: black\">"
							+" 진료를 신청했습니다!</a>");
					clientSession.sendMessage(tmpMsg);
				}
				
//				//스크랩
//				else if("scrap".equals(cmd) && clientSession != null) {
//					//replyWriter = 스크랩누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 스크랩했습니다!</a>");
//
//					clientSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//좋아요
//				else if("like".equals(cmd) && clientSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 좋아요했습니다!</a>");
//
//					clientSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//DEV
//				else if("Dev".equals(cmd) && clientSession != null) {
//					//replyWriter = 좋아요누른사람 , boardWriter = 게시글작성자
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 글을 DEV했습니다!</a>");
//
//					clientSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//댓글채택
//				else if("questionCheck".equals(cmd) && replyWriterSession != null) {
//					//replyWriter = 댓글작성자 , boardWriter = 글작성자
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 채택했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//					
//				}
//				
//				//댓글좋아요
//				else if("commentLike".equals(cmd) && replyWriterSession != null) {
//					log.info("좋아요onmessage되나?");
//					log.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 추천했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
//				
//				
//				//댓글DEV
//				else if("commentDev".equals(cmd) && replyWriterSession != null) {
//					log.info("좋아요onmessage되나?");
//					log.info("result=board="+boardWriter+"//"+replyWriter+"//"+bno+"//"+bgno+"//"+title);
//					//replyWriter=댓글작성자 , boardWriter=좋아요누른사람 
//					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 "
//							+ "<a href='/board/readView?bno=" + bno + "&bgno="+bgno+"'  style=\"color: black\"><strong>"
//							+ title+"</strong> 에 작성한 댓글을 DEV했습니다!</a>");
//
//					replyWriterSession.sendMessage(tmpMsg);
//				}
				
				
					
				
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		// TODO Auto-generated method stub
		log.info("Socket 끊음");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session ) {
        
        SecurityContextImpl context = (SecurityContextImpl)session.getAttributes().get("SPRING_SECURITY_CONTEXT");
        Authentication authentication = context.getAuthentication();
        UserVO user = (UserVO)authentication.getPrincipal();
        
		
		Map<String, Object> httpSession = session.getAttributes();
//		MemberVO loginUser = (MemberVO)httpSession.get("login");
		
		if(user == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = user.getUsername();
		return mid;
		
	}


}
