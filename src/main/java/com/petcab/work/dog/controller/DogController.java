package com.petcab.work.dog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.user.model.vo.Dog;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DogController {
	
	@Autowired
	private DogService service;

	
		@RequestMapping("/signup/Information")
		public String InfromationView() {
			log.info("정보요청");
			return "/signup/Information";
		}
		
		@RequestMapping("/dog/dogInformation")
		public String dogInfromationView() {
			log.info("등록요청");
			return "/dog/dogInformation";
		}
	
		
		@RequestMapping(value = "/dog/dogInformation/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Dog dog) {
			
			log.info(dog.toString());
			
			int result = service.saveDog(dog);
			log.info(dog.toString());		
			
//			if(result > 0) {
				model.addObject("msg", "등록 되었습니다.");
				model.addObject("location", "/signup/Information");
//			} else {
//				model.addObject("msg", " 실패했습니다.");
//				model.addObject("location", "/");
//			}
			
			model.setViewName("common/msg");		
			
			return model;
		}
			
}
