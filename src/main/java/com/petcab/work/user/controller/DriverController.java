package com.petcab.work.user.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.admin.AdminController;
import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.Review;
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
	
	@Autowired
	private CallService callService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dirverApply() {
		
		return "driver/driverApply";
	}
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public ModelAndView dirverDocument(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		log.info(loginMember.toString());
		Driver driver = service.selectDriver(loginMember.getUserNo());

		if (driver != null) {
			if(driver.getStatus().equals("W")) {
				model.addObject("msg", "승인 대기 중인 회원입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");	
			}else if(driver.getStatus().equals("N")){
				model.addObject("msg", "승인 거절된 드라이버 회원입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			}else {	
				model.addObject("msg", "이미 드라이버 회원입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			}
		} else { 
			model.setViewName("driver/driverDocument");
		}
		return model;
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
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView driverMypage(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		log.info(loginMember.toString());
		
		Driver driver = service.selectDriver(loginMember.getUserNo());
		List<Review> review = reviewService.searchUserNo(loginMember.getUserNo());
		
		List<Call> waitCall = callService.driverWaitCallList(loginMember.getUserNo());
		List<Call> endCall = callService.driverEndCallList(loginMember.getUserNo());
		
		log.info(review.toString());
		log.info(waitCall.toString());
		log.info(endCall.toString());
		
		model.addObject("driver", driver);
		model.addObject("review", review);
		model.addObject("waitCall", waitCall);
		model.addObject("endCall", endCall);
		model.setViewName("driver/driverMyPage");
		
		return model;
	}
}
