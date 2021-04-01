package com.petcab.work.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.admin.AdminController;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/driver")
public class DriverController {

	@Autowired
	private DriverService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dirverApply() {
		
		return "driver/driverApply";
	}
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String dirverDocument() {
		
		return "driver/driverDocument";
	}
	
	@RequestMapping(value = "/apply/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Driver driver) {
		
		log.info(driver.toString());
		
		int result = service.saveDriver(driver);
		
		log.info(driver.toString());		
		
		if(result > 0) {
			model.addObject("msg", "드라이버 지원이 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "드라이버 지원에 실패했습니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");		
		
		return model;
	}
}
