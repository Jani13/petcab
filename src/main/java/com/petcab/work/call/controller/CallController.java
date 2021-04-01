package com.petcab.work.call.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Controller
@ControllerAdvice // Model에 글로벌 값을 넣을 수 있다.
@RequestMapping("/call")
public class CallController {
	@Autowired
	private CallService service;
		
	// 일반예약 신청
//	@RequestMapping(value = "/book", method = {RequestMethod.POST})
//	public String bookCall(
//		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//		HttpServletRequest request, Call call, ModelAndView model) {
//		
//		String[] names = {"meeting-time", "where-from", "where-to", 
//				"est-cost", "with-owner", "to-driver"};
//		// 애견정보 추가 필요
//		
//		for (String name : names) {
//			model.addAttribute(name);
//		}
//		
//		service.insertCall(call);
//		
//		return "call/book_gn";
//	}
	
	@RequestMapping(value = "/book", method = {RequestMethod.POST})
	public String bookCall(
		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
		HttpServletRequest request, Call call, ModelAndView model) {
		
		String[] names = {"meeting-time", "where-from", "where-to", 
				"est-cost", "with-owner", "to-driver"};
		// 애견정보 추가 필요
		
		for (String name : names) {
			model.addAttribute(name);
		}
		
		service.insertCall(call);
		
		return "call/book_gn";
	}
	
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String bookCall() {

		return "call/book_gn";
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
