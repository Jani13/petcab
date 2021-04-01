package com.petcab.work.call.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Controller
@RequestMapping("/call")

public class CallController {
	@Autowired
	private CallService service;
		
	// 일반예약 신청
	@RequestMapping(value = "/book", method = {RequestMethod.POST})
	public ModelAndView book(
		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
		HttpServletRequest request, Call call, ModelAndView model) {
		
		System.out.println(call);
		
		int result = 0;
		
		
		
		return model;
	}
	
	// 일반예약 취소
	@RequestMapping(value = "/cancel", method = {RequestMethod.POST})
	public ModelAndView cancel(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, Call call, ModelAndView model) {
		
		
		return model;
	}

	// 일반예약 조회
	@RequestMapping(value = "/view", method = { RequestMethod.GET })
	public ModelAndView view(@RequestParam("callNo") int callNo, ModelAndView model) {
		Call call = service.selectCall(callNo);
		
		model.addObject("call", call);
		model.setViewName("call/view");
		
		return model;
	}
	
}
