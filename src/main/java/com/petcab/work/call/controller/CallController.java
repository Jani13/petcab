package com.petcab.work.call.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.user.model.service.PartnerService;
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
	
	@Autowired
	private PartnerService partnerService;
	
//	@Autowired
//	private DriverService driverService;

	@Autowired
	private DogService dogService;
	
	// 드라이버 예약보기
	@RequestMapping(value = "/driver/confirm", method = RequestMethod.GET)
	public ModelAndView bookDriver(
			ModelAndView model) {		
		
		List<Call> calls = new ArrayList<>();
		
		// 신청 status 예약목록 불러오기
		calls = callService.selectCallListForDriver();
		
		model.addObject("calls", calls);
		
		model.setViewName("call/book_driver_confirm");
				
		return model;
	}
	
	@RequestMapping(value="/driver/confirm/select", method = {RequestMethod.POST})
	public @ResponseBody String selectCallByDriver(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam String callNo, @RequestParam String callType,
			HttpServletRequest request) {
						
//		int callNo = call.getCallNo();
		
		System.out.println("callNo : " + callNo);
		
		int result = callService.updateCallByDriver(Integer.parseInt(callNo));
				
		return String.valueOf(result);
	}

	// 일반예약 신청 화면으로 이동
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book(@SessionAttribute(name="loginMember", required = false) Member loginMember) {
		return "call/book_gn";
	}

	// 일반예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book/done", method = {RequestMethod.POST})
	public ModelAndView book(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request,
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			@ModelAttribute Call call,
            RedirectAttributes redirectAttributes,			
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
		
//		model.addObject("call", call);
		
//		model.addObject("callNo", call.getCallNo()); // 추가 시 쿼리스트링으로 callNo가 전달된다.
	    				
		String callNo = String.valueOf(call.getCallNo()); // 아래 컨트롤러에서 url 값으로 받는 것으로 보인다.
								
//        model.setViewName("call/book_gn_done");
        
		RedirectView redirectView = new RedirectView();
		redirectAttributes.addFlashAttribute("call", call); // flash!
//		redirectAttributes.addAttribute("call", call); // requestParam으로, String, primitives 타입에 한정된다.
		
		// 완료화면에서 예약취소 후 뒤로가기 버튼 누르지 못하게 disable 해야 ***************************************************
		
		redirectView.setUrl(callNo + "/done");
		redirectView.setExposeModelAttributes(false);
		
//		model.setView(new RedirectView(callNo + "/done")); // redirect
		model.setView(redirectView); // redirect
		
		return model;
	}	
	
//	@MessageMapping("/book/{callNo}/done")
	@RequestMapping(value = "/book/{callNo}/done", method = RequestMethod.GET)
	public ModelAndView bookRedirect(
			ModelAndView model
			) {
		
		model.setViewName("call/book_gn_done");

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
	public ModelAndView bookEmg(ModelAndView model,
			@SessionAttribute(name="loginMember", required = false) Member loginMember) {
		List<Partner> shop = partnerService.getShopList();
		List<Partner> hospital = partnerService.getHospitalList();
		List<Partner> school = partnerService.getSchoolList();

		log.info(shop.toString());
		log.info(hospital.toString());
		log.info(school.toString());

		model.addObject("shop", shop);
		model.addObject("hospital", hospital);
		model.addObject("school", school);
		model.addObject("loginMember",loginMember);
		model.setViewName("call/book_em_a");
		
		return model;
	}

	@RequestMapping(value = "/book/emg/done", method = {RequestMethod.POST})
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

//		model.setViewName("call/book_gn_done");
		model.setViewName("call/book_gn_pay");

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
