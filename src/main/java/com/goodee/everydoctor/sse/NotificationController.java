package com.goodee.everydoctor.sse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class NotificationController {
	
	//전체
//	public List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	//1:1
	public Map<String, SseEmitter> emitters = new HashMap<>();

	
	//method for client subscription
	@CrossOrigin
	@RequestMapping(value="/subscribe", consumes = MediaType.ALL_VALUE)
	public SseEmitter subscribe(@RequestParam String userID) {
		SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
		sendInitEvent(sseEmitter);
		emitters.put(userID, sseEmitter);
		log.info("서브스크립 : {}", userID);
		
		//만료되면 삭제
		sseEmitter.onCompletion(() -> emitters.remove(sseEmitter));
		sseEmitter.onTimeout(() -> emitters.remove(sseEmitter));
		sseEmitter.onError((e) -> emitters.remove(sseEmitter));
		
		return sseEmitter;
	}

	
	
	//method for dispatching events to all clients
//	@PostMapping(value = "/dispatchEvent")
//	public void dispatchEventToClients(@RequestParam String title, @RequestParam String text) {
//	
//		String eventFormatted = new JSONObject()
//				.put("title",title)
//				.put("text",text).toString();
//		
//		for(SseEmitter emitter : emitters) {
//			try {
//				emitter.send(SseEmitter.event().name("latestNews").data(eventFormatted));
//			} catch (IOException e) {
//				emitters.remove(emitter);
//			}
//		}
//	}
	//method for dispatching events to a Specific User
	@PostMapping(value = "/dispatchEventToSpecificUser")
	public void dispatchEventToClients(@RequestParam String title, @RequestParam String text,
			@RequestParam String userID) {
		
		log.info("유저아이디 {}", userID);
		
		int num = (int)(Math.random()*1000);
		
		String eventFormatted = new JSONObject()
				.put("toastId", "toast"+num)
				.put("title",title)
				.put("loca", "/user/profile")
				.put("text","뿅뿅 한별이 화이탱").toString();
		
		SseEmitter sseEmitter = emitters.get(userID);
		if(sseEmitter != null) {
			try {
				sseEmitter.send(SseEmitter.event().name("latestNews").data(eventFormatted));
			} catch (IOException e) {
				emitters.remove(sseEmitter);
			}
		}
	}
	private void sendInitEvent(SseEmitter sseEmitter) {
		try {
			sseEmitter.send(SseEmitter.event().name("INIT"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}