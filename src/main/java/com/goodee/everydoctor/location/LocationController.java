package com.goodee.everydoctor.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodee.everydoctor.agency.AgencyVO;

@Controller
@RequestMapping("location/*")
public class LocationController {
	
	@Autowired
	private LocationService locationService;
	
	@GetMapping("viewCorona")
	public void viewCorona()throws Exception{
		
	}
	
	@GetMapping("ronaco")
	@ResponseBody
	public List<AgencyVO> findCoronaList()throws Exception{
		List<AgencyVO> al = locationService.findCoronaList();
		return al;
	}
	@GetMapping("findPharmacy")
	public void findPharmacy()throws Exception{
		
	}
	@GetMapping("/pharmacy")
	@ResponseBody
	public List<AgencyVO> findPharmacyList()throws Exception{
		List<AgencyVO> al = locationService.findPharmacyList();
		return al;
	}

}
