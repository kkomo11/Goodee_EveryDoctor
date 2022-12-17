package com.goodee.everydoctor.telemedicine;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@ControllerAdvice
@Slf4j
public class TelemedicineController {    
    private final TelemedicineService telemedicineService;
    
    @Autowired
    public TelemedicineController(final TelemedicineService telemedicineService) {
        this.telemedicineService = telemedicineService;
    }

    @GetMapping({"/telemedicine"})
    public ModelAndView displayMainPage(final Long id, final String uuid) {
        return this.telemedicineService.displayMainPage(id, uuid);
    }

    @PostMapping(value = "/room", params = "action=create")
    public ModelAndView processRoomSelection(@ModelAttribute("id") final String sid, @ModelAttribute("uuid") final String uuid, final BindingResult binding) {
    	
    	return this.telemedicineService.processRoomSelection(sid, uuid, binding);
    }
    
    @PostMapping(value = "/room", params = "action=make")
    @ResponseBody
    public Map<String, Object> processRoomCreate(@ModelAttribute("id") final String sid, @ModelAttribute("uuid") final String uuid, final BindingResult binding) {
    	log.info("dndldpdpdl   {}   {}  {} {} ", sid, uuid, binding, "qkah");
    	
    	Map<String, Object> result =  this.telemedicineService.processRoomCreate(sid, uuid, binding);
    	
    	if(result!=null) {
    		//알람을 보낸다.
    	}
    	
    	return result;
    }
    
    //sid -방번호, uuid -사용자
    @GetMapping("/room/{sid}/user/{uuid}")
    public ModelAndView displaySelectedRoom(@PathVariable("sid") final String sid, @PathVariable("uuid") final String uuid) {
        return this.telemedicineService.displaySelectedRoom(sid, uuid);
    }

    @GetMapping("/room/{sid}/user/{uuid}/exit")
    public ModelAndView processRoomExit(@PathVariable("sid") final String sid, @PathVariable("uuid") final String uuid) {
        return this.telemedicineService.processRoomExit(sid, uuid);
    }

    @GetMapping("/room/random")
    public ModelAndView requestRandomRoomNumber(@ModelAttribute("uuid") final String uuid) {
        return telemedicineService.requestRandomRoomNumber(uuid);
    }

    @GetMapping("/offer")
    public ModelAndView displaySampleSdpOffer() {
        return new ModelAndView("thymeleaf/sdp_offer");
    }

    @GetMapping("/stream")
    public ModelAndView displaySampleStreaming() {
        return new ModelAndView("thymeleaf/streaming");
    }
}
