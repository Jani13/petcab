package com.petcab.work.call.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Controller
@ControllerAdvice // Model에 글로벌 값을 넣을 수 있다.
@RequestMapping("/call")
public class CallController {	
	@Autowired
	private CallService callService;
	
//	@Autowired
//	private DriverService driverService;

	@Autowired
	private DogService dogService;

	// 일반예약 신청 화면으로 이동
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book() {

		return "call/book_gn";
	}

	// 일반예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book", method = {RequestMethod.POST})
	public ModelAndView book(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request,
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			@ModelAttribute Call call,
			ModelAndView model) {
		
		Stream<String> stream = Arrays.stream(dogNos);
		
		log.info(dogNos.toString());
		
		List<Dog> dogs = new ArrayList<>();
		
		// dogNo로 조회한 dog만 dogs 리스트에 넣어서 call에 set 하기
		stream.forEach(dogNo -> {
			
			if(!dogNo.equals("")) { // 값이 있으면	
				Dog dog = dogService.searchByDogNo(Integer.parseInt(dogNo));
				dogs.add(dog);
			} else { // 값이 없으면
				// 
			}
		});
		
		log.info(dogs.toString());
		
		call.setDogs(dogs);

		int result = callService.insertCall(call); // 서비스등록

		log.info(call.toString());

		if(result > 0) {
			// 성공
		} else {
			// 실패
		}

		model.addObject("call", call);

		model.setViewName("call/book_gn_pay");

		return model;
	}	

	// 일반예약 취소
	@RequestMapping(value = "/book/cancel", method = {RequestMethod.POST})
	public ModelAndView cancel(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, 
			@ModelAttribute Call call,
			ModelAndView model) {

		int result = callService.updateCall(call.getCallNo());

		System.out.println(call.getCallNo());
		
		log.info(call.toString());

		call = callService.selectCall(call.getCallNo());

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
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			ModelAndView model) {
		
		Stream<String> stream = Arrays.stream(dogNos);
		
		log.info(dogNos.toString());
		List<Dog> dogs = new ArrayList<>();
		
		// dogNo로 조회한 dog만 dogs 리스트에 넣어서 call에 set 하기
		stream.forEach(dogNo -> {
			
			if(!dogNo.equals("")) { // 값이 있으면	
				Dog dog = dogService.searchByDogNo(Integer.parseInt(dogNo));
				dogs.add(dog);
			} else { // 값이 없으면
				// 
			}
		});
		
		log.info(dogs.toString());
		
		emgCall.setDogs(dogs);
		
		// **********파트너 조회해서 emgCall에 set 하기
		
		emgCall.setPartner(partner);

		int resultE = callService.insertEmgCall(emgCall);

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

	// 긴급예약 취소
	@RequestMapping(value = "/book/emg/cancel", method = {RequestMethod.POST})
	public ModelAndView cancelEmg(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, 
			@ModelAttribute EmgCall emgCall, 
			ModelAndView model) {
								
		int result = callService.updateCall(emgCall.getCallNo()); // GEN_CALL
				
		System.out.println("emgCallNo : " + emgCall.getCallNo());
		
		List<EmgCall> emgCalls = callService.selectEmgCall(emgCall.getCallNo());
		
		log.info(emgCalls.get(0).toString());
			
		if(result > 0) {
			// 성공
		} else {
			// 실패
		}
				
		model.addObject("emgCall", emgCalls.get(0));
				
		model.setViewName("call/book_gn_cancel");

		return model;
	}
	
	// 애견정보 불러오기
	@RequestMapping(value = "/book/selectDogs/{userId}", method = RequestMethod.GET)
	public String selectDogs(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(value = "userId", required = false) String userId,
			Model model,
			HttpServletRequest request
			) { // 예약화면에서 예약자 userId를 가져와야한다.
						
		List<Dog> dogs = new ArrayList<>();
				
		dogs = dogService.searchUserId(userId);
		
		log.info(dogs.toString());
		
		model.addAttribute("dogs", dogs);
				
		return "dog/dogsForCall";
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


	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchPoint(ModelAndView model,
			HttpServletRequest request) {
		if (request.getParameter("option").equals("start")) {
			return "call/startPoint";
		} else {
			return "call/endPoint";
		}
	}
	
}
