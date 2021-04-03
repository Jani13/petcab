package com.petcab.work.call.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	// 일반예약 신청 화면으로 이동
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book() {

		return "call/book_gn";
	}
	
	// 일반예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book/done", method = {RequestMethod.POST})
	public ModelAndView book(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, 
			@ModelAttribute Call call, ModelAndView model) {
		// 애견정보 추가 필요
		
		log.info(call.toString());
		
		int result = service.insertCall(call); // 서비스등록
		
		log.info(call.toString());

		if(result > 0) {
			model.addObject(call);
		} else {
			// 서비스등록 실패
		}
		
		model.addObject("call", call);

		model.setViewName("call/book_gn_done");
				
		return model;
	}	
	
	@RequestMapping(value = "/book/", method = RequestMethod.GET)
	public String bookDone() {

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
