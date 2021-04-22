package com.petcab.work.call.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
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
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.payment.model.vo.Payment;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Controller
@ControllerAdvice // Model에 글로벌 값을 넣을 수 있다.
@RequestMapping("/call")
public class CallController {	
	
	@Autowired private PaymentService service;
	
	@Autowired
	private CallService callService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private DriverService driverService;

	@Autowired
	private DogService dogService;

	@Autowired
	private SimpMessagingTemplate template;
	
	@Autowired
	public CallController(SimpMessagingTemplate template) {
		this.template = template;
	}
	
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
	public @ResponseBody int selectCallByDriver(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam(name="callNo") String callNo, 
			@RequestParam(name="dUserNo") String dUserNo,
			HttpServletRequest request) {
								
 		int userNo = loginMember.getUserNo();
		
		System.out.println("dUserNo : " + userNo);
		
		System.out.println("callNo : " + callNo);
		
		int result = callService.updateCallByDriver(userNo, Integer.parseInt(callNo));
				
		return result;
	}
	
	// 드라이버 정보 업데이트
	@RequestMapping(value="/book/{callNo}/driver", method = {RequestMethod.GET})
	@ResponseBody
	public Driver getDriver(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@PathVariable(name="callNo") int callNo,
			@RequestParam(name="userNo") int userNo,
			Driver driver,
			HttpServletRequest request) {
		
		System.out.println("getDriver() 메소드는 타나? ");
				
		driver = driverService.selectDriverMember(userNo);
		
		System.out.println("getDriver() : " + driver);
		
		return driver;
	}
	
//	@MessageMapping("/notify/{callNo}")
//	public void handle(String message) {
//		
//		System.out.println("정일님 천재 : " + message);
//
//        JSONParser parser = new JSONParser();
//        
//        JSONObject obj = null;
//        
//        try {
//			obj = (JSONObject)parser.parse(message);
//		} catch (org.json.simple.parser.ParseException e) {
//			e.printStackTrace();
//		}
//
//        System.out.println(obj);
//        System.out.println(obj.get("callNo"));
//        System.out.println(obj.get("dUserNo"));
//        
//        String callNo = (String) obj.get("callNo");
//        int dUserNo = Integer.parseInt((String) obj.get("dUserNo"));
//		
//		Driver driver = driverService.selectDriver(dUserNo);
//		
//		System.out.println(driver);
//		
//		String a = "/work/call/book/" + callNo + "/done";
//		
//		System.out.println(a);
//		
////		template.convertAndSend("/call/book/done", driver);
//		
//		template.convertAndSend(a, message);		
////		template.convertAndSend("/work/call/book/notify", message);		
//		template.convertAndSend("/work/call/notify/" + callNo, "test");	
//		template.convertAndSend("/work/notify/" + callNo, "test");
//	}
	
	// 일반예약 신청 화면으로 이동
	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public String book(@SessionAttribute(name="loginMember", required = false) Member loginMember) {
		return "call/book_gn";
	}
	
	// 일반예약 신청 정보 입력 후 가결제 화면으로 이동
	@RequestMapping(value = "/book/prepay", method = {RequestMethod.POST})
	public ModelAndView prepay(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request,
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			@ModelAttribute Call call,
//            RedirectAttributes redirectAttributes,			
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
		
		log.info(call.toString());

		int result = callService.insertCall(call);
		
		log.info("insertCall(call) : " + String.valueOf(result));
					
		String callNo = String.valueOf(call.getCallNo());
		
		model.addObject("estCost", request.getParameter("estCost"));
		model.addObject("call", call);
		model.addObject("callNo", callNo);
		model.setViewName("call/book_gn_pay");
		
		return model;
	}	
	
	// 일반예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book/{callNo}/done", method = {RequestMethod.GET})
	public ModelAndView book(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@PathVariable int callNo,
			HttpServletRequest request,
			@RequestParam(value="callNo", required=true) int callNo,
			@RequestParam(value="impUid", required=true) String impUid,
			@RequestParam(value="merchantUid", required=true) String merchantUid,
			@ModelAttribute Call call,
			ModelAndView model) {
		
		call = callService.selectCall(callNo);
		
		int result = callService.updatUid(call.getMerchantUid());
		log.info("book() : " + call.toString());

		model.addObject("call", call);
		model.setViewName("call/book_gn_done");
		
		return model;		
	}	

	@RequestMapping(value = "/book/cancel", method = {RequestMethod.POST})
	public ModelAndView cancel(
			@SessionAttribute(name = "loginMember", required=false) Member loginMember,
			HttpServletRequest request, 
			@ModelAttribute Call call,
			@ModelAttribute Payment payment,
			@RequestParam(value="impUid", required=true) String impUid,
			ModelAndView model) {

		callService.updateCall(call.getCallNo());

		 int resulta = service.updatPay(payment.getImpUid());
		System.out.println("????????????????????????????????????????"+payment);
		log.info(payment.toString());
		
		int result = callService.updateCall(call.getCallNo());

		System.out.println("cancel() callNo : " + call.getCallNo());
		
		log.info(call.toString());

		call = callService.selectCall(call.getCallNo());

		log.info(call.toString());
		
		String dUserNo = request.getParameter("dUserNo");
		
		System.out.println("String dUserNo : " + dUserNo);
		
		if (dUserNo != null && dUserNo != "") {
			Driver driver = driverService.selectDriverMember(Integer.parseInt(dUserNo));

			call.setDriver(driver);
		}

		model.addObject("call", call);

		model.setViewName("call/book_gn_cancel");

		return model;
	}
	
//	// 일반예약 취소
//	@RequestMapping(value = "/book/cancel", method = {RequestMethod.POST})
//	public ModelAndView cancel(
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
//			HttpServletRequest request, 
//			@ModelAttribute Call call,
//			ModelAndView model) {
//
//		int result = callService.updateCall(call.getCallNo());
//
//		System.out.println(call.getCallNo());
//		
//		log.info(call.toString());
//
//		call = callService.selectCall(call.getCallNo());
//
//		log.info(call.toString());
//
//		if(result > 0) {
//			// 성공
//		} else {
//			// 실패
//		}
//
//		model.addObject("call", call);
//
//		model.setViewName("call/book_gn_cancel");
//
//		return model;
//	}
	
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
			@RequestParam(name="pUserNo", required=false) String pUserNo,
			@ModelAttribute Partner partner,
			@ModelAttribute EmgCall emgCall,
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			ModelAndView model) {
		
		Stream<String> stream = Arrays.stream(dogNos);
			System.out.println("???????????????????????????????"+pUserNo);
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
	
	// 긴급콜 결제했을때 넘어가는페이지 4/20(은주)
	@RequestMapping(value = "/book/emg_done", method = RequestMethod.GET)
	public ModelAndView emg_done(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request,
			@RequestParam(name="pUserNo", required=false) String pUserNo,
			@ModelAttribute Partner partner,
			@ModelAttribute EmgCall emgCall,
			@RequestParam(value="callNo", required=true) int callNo,
			ModelAndView model) {
		
		int result = 0;
		int resultE = callService.selectEmerCall(callNo);
		log.info(emgCall.toString());

		if(result > 0) {
			// 성공
		} else {
			// 실패
		}

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
