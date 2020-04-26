package com.dogcatlife.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class mapController {
	
	@RequestMapping("/hospital_map.mysql")
	public ModelAndView hospital() {
		System.out.println("병원맵 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hospital_map/hospital_map");
		return modelAndView;
	}
	
	@RequestMapping("/hotel_map.mysql")
	public ModelAndView hotel() {
		System.out.println("호텔맵 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hotel_map/hotel_map");
		return modelAndView;
	}
	
	
}
