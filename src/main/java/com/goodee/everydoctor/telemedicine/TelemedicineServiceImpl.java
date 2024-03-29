package com.goodee.everydoctor.telemedicine;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisMapper;
import com.goodee.everydoctor.hospital.diagnosis.HospitalDiagnosisVO;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisMapper;
import com.goodee.everydoctor.pet.diagnosis.PetDiagnosisVO;
import com.goodee.everydoctor.util.Parser;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class TelemedicineServiceImpl implements TelemedicineService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String REDIRECT = "redirect:/";
    
    private final RoomService roomService;
    private final Parser parser;
    @Autowired
    private HospitalDiagnosisMapper hospitalDiagnosisMapper;
    
    @Autowired
    private PetDiagnosisMapper petDiagnosisMapper;

    @Autowired
    public TelemedicineServiceImpl(final RoomService roomService, final Parser parser) {
        this.roomService = roomService;
        this.parser = parser;
    }

    @Override
    public ModelAndView displayMainPage(final Long id, final String uuid) {
        final ModelAndView modelAndView = new ModelAndView("telemedicine/telemedicine");
        modelAndView.addObject("id", id);
        modelAndView.addObject("rooms", roomService.getRooms());
        modelAndView.addObject("uuid", uuid);

        return modelAndView;
    }
    
    public Map<String, Object> processRoomCreate(final String sid, final String uuid, final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // simplified version, no errors processing
            return null;
        }
        Optional<Long> optionalId = parser.parseId(sid);
        optionalId.ifPresent(id -> Optional.ofNullable(uuid).ifPresent(name -> roomService.addRoom(new Room(id))));
        
        HashMap<String, Object> map = new HashMap<>();
        
        
        map.put("uuid", uuid);
        map.put("roomid", roomService.findRoomByStringId(sid));
        return map;
    }
    
    @Override
    public ModelAndView processRoomSelection(final String sid, final String uuid, final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            // simplified version, no errors processing
            return new ModelAndView(REDIRECT);
        }
        Optional<Long> optionalId = parser.parseId(sid);
        optionalId.ifPresent(id -> Optional.ofNullable(uuid).ifPresent(name -> roomService.addRoom(new Room(id))));

        return this.displayMainPage(optionalId.orElse(null), uuid);
    }

    @Override
    public ModelAndView displaySelectedRoom(final String sid, final String uuid, final String dansnum, final String pDansNum) throws Exception {
        // redirect to main page if provided data is invalid
        ModelAndView modelAndView = new ModelAndView(REDIRECT);

        if (parser.parseId(sid).isPresent()) {
            Room room = roomService.findRoomByStringId(sid).orElse(null);
            if(room != null && uuid != null && !uuid.isEmpty()) {
                logger.debug("User {} is going to join Room #{}", uuid, sid);
                // open the chat room
                modelAndView = new ModelAndView("telemedicine/chat_room", "id", sid);
                modelAndView.addObject("uuid", uuid);
                
                if(dansnum != null) {
                	//get diagnosis 내용
                    HospitalDiagnosisVO diagnosisVO = new HospitalDiagnosisVO();
                    diagnosisVO.setDansNum(Long.parseLong(dansnum));
                    
                    diagnosisVO = hospitalDiagnosisMapper.findHospitaldiagnosisByDansnum(diagnosisVO);
                    
                    modelAndView.addObject("diagnosisVO",diagnosisVO);
                }
                
                if(pDansNum != null) {
                	PetDiagnosisVO petDiagnosisVO = new PetDiagnosisVO();
                	petDiagnosisVO.setPDansNum(Long.parseLong(pDansNum));
                	
                	petDiagnosisVO = petDiagnosisMapper.findPetDiagnosisBypDansnum(petDiagnosisVO);
                	
                	modelAndView.addObject("petDiagnosisVO", petDiagnosisVO);
                }
            }
        }

        return modelAndView;
    }

    @Override
    public ModelAndView processRoomExit(final String sid, final String uuid) {
        if(sid != null && uuid != null) {
            logger.debug("User {} has left Room #{}", uuid, sid);
            // implement any logic you need
        }
        return new ModelAndView(REDIRECT);
    }

    @Override
    public ModelAndView requestRandomRoomNumber(final String uuid) {
        return this.displayMainPage(randomValue(), uuid);
    }

    private Long randomValue() {
        return ThreadLocalRandom.current().nextLong(0, 100);
    }
}
