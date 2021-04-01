package com.petcab.work.dog.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DogController {

		@RequestMapping("/signup/Information")
		public String Information(HttpServletRequest request) {
			
			return"/signup/Information";
		}
		@RequestMapping(value ="dog/dogInformation", method = {RequestMethod.GET,RequestMethod.POST})
		public String dogInformation(@ModelAttribute Dog dog) {
			
			log.info("{},{}",dog.getAnimalNo(),dog.getDogName());
		return "/dog/dogInformation";
	}
}
