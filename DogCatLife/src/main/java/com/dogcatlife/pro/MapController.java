package com.dogcatlife.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MapController {
	
	@RequestMapping("/hospital_map.mysql")
	public ModelAndView hospital_map() {
		System.out.println("병원맵 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hospital_map/hospital_map");
		return modelAndView;
	}
	
	@RequestMapping("/hotel_map.mysql")
	public ModelAndView hotel_map() {
		System.out.println("호텔맵 호출");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hotel_map/hotel_map");
		return modelAndView;
	}
}
