package com.goodee.everydoctor.sse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.goodee.everydoctor.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class NotificationController {
	
	@Autowired
	private AlarmService alarmService;
	
	//전체
//	public List<SseEmitter> emitters = new CopyOnWriteArrayList<>();
	//1:1
	public Map<String, SseEmitter> emitters = new HashMap<>();

	
	//method for client subscription
	@CrossOrigin
	@RequestMapping(value="/subscribe", consumes = MediaType.ALL_VALUE)
	public SseEmitter subscribe(@RequestParam String userID) {
		SseEmitter se = emitters.get("Member");
		SseEmitter sseEmitter = new SseEmitter(Long.MAX_VALUE);
		sendInitEvent(sseEmitter);
		emitters.put(userID, sseEmitter);
		
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
//	@PostMapping(value = "/dispatchEventToSpecificUser")
	public void dispatchEventToClients(@RequestParam String title, @RequestParam String text,
			@RequestParam String url, @RequestParam String userID) {
		
		log.info("유저아이디 {}", userID);
		
		int num = (int)(Math.random()*1000);
		
		String eventFormatted = new JSONObject()
				.put("toastId", "toast"+num)//알림받을떄 구분해줄수 잇는 구분값
				.put("title",title)
				.put("link", url)//링크
				.put("text",text).toString();
		
		SseEmitter sseEmitter = emitters.get(userID);
		if(sseEmitter != null) {
			try {
				sseEmitter.send(SseEmitter.event().name("latestNews").data(eventFormatted));
			} catch (IOException e) {
				emitters.remove(sseEmitter);
			}
		}else {
			log.info("알람 받을 사람이 없어요");
		}
	}
	private void sendInitEvent(SseEmitter sseEmitter) {
		try {
			sseEmitter.send(SseEmitter.event().name("INIT"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@PostMapping("/insertAlarm")
	public int setAlarm(AlarmVO alarmVO)throws Exception{
		int result = alarmService.setAlarm(alarmVO);
		
		return result;
	}
	@GetMapping("/alarmList")
	@ResponseBody
	public List<AlarmVO> findAlarmList(@AuthenticationPrincipal UserVO userVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlarmReceiver(userVO.getUsername());
			
			List<AlarmVO> al = alarmService.findAlarmList(alarmVO);
			
			mv.addObject("alarmList", al);
			
			return al;
	}
	
}