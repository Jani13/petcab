package com.petcab.work.call.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

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
				
		int result = service.insertCall(call); // 서비스등록
		
		log.info(call.toString());

		if(result > 0) {
			// 성공
		} else {
			// 실패
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
	@RequestMapping(value = "/book/cancel", method = {RequestMethod.POST})
	public ModelAndView cancel(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, 
			@ModelAttribute Call call, ModelAndView model) {
										
		int result = service.updateCall(call.getCallNo()); // DB 상태 업데이트
		
		log.info(call.toString()); // call 객체에 callNo만 존재
		
		call = service.selectCall(call.getCallNo());
		
		log.info(call.toString());
		
		if(result > 0) {
			// 성공
		} else {
			// 실패
		}
				
		model.addObject("call", call);
		
		model.setViewName("call/book_gn_cancel");
		
		return model;
	}
	
	// 긴급예약 신청 정보 입력 a
	@RequestMapping(value = "/book/emg_a", method = RequestMethod.GET)
	public String bookEmg() {

		return "call/book_em_a";
	}

	@RequestMapping(value = "/book/emg_a", method = {RequestMethod.POST})
	public ModelAndView bookEmg(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request,
			@ModelAttribute Partner partner,
			@ModelAttribute EmgCall emgCall,
			ModelAndView model) {
						
		emgCall.setPartner(partner);
		
//		int resultG = service.insertCall(emgCall); // callNo 생성됨
				
		int resultE = service.insertEmgCall(emgCall);
					
		if(resultE > 0) {
			// 성공
		} else {
			// 실패
		}
		
		log.info(emgCall.toString());
		
		model.addObject("emgCall", emgCall);

		model.setViewName("call/book_gn_done");
				
		return model;
	}	
	
	// JSON으로 데이터 전송 시 AJAX 필요
//	@RequestMapping(value = "/book/emg_a", 
//			method = {RequestMethod.POST}, 
//			produces = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public Call bookEmg(
//			@ModelAttribute Partner partner,
//			@ModelAttribute EmgCall emgCall,
//			@ModelAttribute Call call) {
//
//		// partnerName : Partner
//		// pickupTime : Call
//		// toPartner : EmgCall
//				
//		emgCall.setPartner(partner);
//		call.setEmgCall(emgCall);
//						
//		log.info(emgCall.toString());
//		
//		// 쿼리문
//		
//		return call; // blank page 로...
//	}	

}
