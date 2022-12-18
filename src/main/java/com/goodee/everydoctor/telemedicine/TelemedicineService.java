package com.goodee.everydoctor.telemedicine;

import java.util.Map;

import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

public interface TelemedicineService {
    ModelAndView displayMainPage(Long id, String uuid);
    ModelAndView processRoomSelection(String sid, String uuid, BindingResult bindingResult);
    ModelAndView displaySelectedRoom(String sid, String uuid, String dansnum)throws Exception;
    ModelAndView processRoomExit(String sid, String uuid);
    ModelAndView requestRandomRoomNumber(String uuid);
    Map<String, Object> processRoomCreate(final String sid, final String uuid, final BindingResult bindingResult) ;
}
