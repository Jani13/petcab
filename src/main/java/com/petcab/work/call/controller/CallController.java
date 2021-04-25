package com.petcab.work.call.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.dog.model.service.DogService;
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
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam(name = "callNo") String callNo, 
			HttpServletRequest request) {
								
 		int userNo = loginMember.getUserNo();
		
		System.out.println("dUserNo : " + userNo);
		
		System.out.println("callNo : " + callNo);
		
		int result = callService.updateCallByDriver(userNo, Integer.parseInt(callNo));
				
		return result;
	}
	
	@RequestMapping(value="/driver/confirm/finish", method = {RequestMethod.POST})
	public @ResponseBody int finishCallByDriver(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam(name = "callNo") String callNo, 
			HttpServletRequest request) {
												
		System.out.println("callNo : " + callNo);
		
		int result = callService.finishCallByDriver(Integer.parseInt(callNo));
				
		return result;
	}
	
	// 드라이버 정보 업데이트
	@RequestMapping(value={"/book/{callNo}/driver", "/book/emg/{callNo}/driver"}, 
			method = {RequestMethod.GET})
	@ResponseBody
	public Driver getDriver(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(name = "callNo") int callNo,
			@RequestParam(name = "userNo") int userNo,
			Driver driver,
			HttpServletRequest request) {
		
		System.out.println("getDriver() 메소드는 타나? ");
				
		driver = driverService.selectDriverMember(userNo);
		
		System.out.println("getDriver() : " + driver);
		
		return driver;
	}
	
	// 드라이버 예약보기 화면에서 기존에 선택한 예약내역 불러오기
	@RequestMapping(value="/driver/confirm/progress", method = {RequestMethod.POST})
	@ResponseBody
	public Call getCall(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestBody String json,
			HttpServletRequest request) {
		
		System.out.println("getCall() 메소드는 타나? ");
		
		JSONParser parser = new JSONParser();
		
		JSONObject jsonObj = new JSONObject();
		
		try {
			jsonObj = (JSONObject) parser.parse(json);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String callNo = (String) jsonObj.get("callNo");
		
		System.out.println(callNo);
		
		Call call = callService.selectCall(Integer.parseInt(callNo));
		
		System.out.println(call);
				
		return call;
	}
	
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
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			@ModelAttribute Call call,
			ModelAndView model) {
//		System.out.println("prepay() paidAmount : " + request.getParameter("paidAmount"));
		
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
		
		call.setPaidAmount(paidAmount); // 예상금액
		
		log.info(call.toString());

		if(call.getCallNo()>0) {
			
		}else {			
			int resultI = callService.insertCall(call);
			log.info("insertCall(call) : " + String.valueOf(resultI));
		}
				

		String callNo = String.valueOf(call.getCallNo());
		
//		model.addObject("estCost", request.getParameter("estCost"));
		model.addObject("call", call);
		model.addObject("callNo", callNo);
		model.setViewName("call/book_gn_pay");
		
		return model;
	}	
	
	// 긴급예약 신청 정보 입력 후 가결제 화면으로 이동
	@RequestMapping(value = "/book/emg/prepay", method = {RequestMethod.POST})
	public ModelAndView prepayEmg(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request,
			@RequestParam(value="dogNo", required=true) String[] dogNos,
			@RequestParam(value="pUserNo", required=true) String pUserNo,
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			@ModelAttribute EmgCall emgCall,
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
		
		log.info(emgCall.toString());
		if(emgCall.getCallNo()>0) {			
		}else {			
			int result = callService.insertEmgCall(emgCall);
			log.info("insertCall(call) : " + String.valueOf(result));
		}
		
					
		String callNo = String.valueOf(emgCall.getCallNo());
		
		Partner partner = partnerService.selectPartner(Integer.parseInt(pUserNo));
		
		log.info(partner.toString());
		
		emgCall.setPartner(partner);
		
		emgCall.setPaidAmount(paidAmount);
		
		// model.addObject("estCost", request.getParameter("estCost"));
		model.addObject("emgCall", emgCall);
		model.addObject("callNo", callNo);
		model.setViewName("call/book_gn_pay");
		
		return model;
	}	
	
	// 일반예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book/{callNo}/done", method = {RequestMethod.POST})
	public ModelAndView book(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@PathVariable int callNo,
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			HttpServletRequest request,
			@ModelAttribute Call call,
			ModelAndView model) {
		
		System.out.println("book() call.paidAmount : " + call.getPaidAmount());
		
		System.out.println("book() paidAmount : " + paidAmount);
		
		String impUid = request.getParameter("impUid");
		
		System.out.println(impUid);
		
		call = callService.selectCall(callNo);
		
		call.setPaidAmount(paidAmount);
		
		log.info("book() : " + call.toString());
		
//		model.addObject("estCost", request.getParameter("estCost"));
		model.addObject("call", call);
		model.setViewName("call/book_gn_done");
		
		return model;		
	}	
	
	// 긴급예약 신청 정보 입력 후 예약완료 화면으로 이동
	@RequestMapping(value = "/book/emg/{callNo}/done", method = {RequestMethod.POST})
	public ModelAndView bookEmg(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@PathVariable(name="callNo") int callNo,
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			HttpServletRequest request,
			@ModelAttribute EmgCall emgCall,
			ModelAndView model) {
		
		System.out.println("bookEmg() call.paidAmount : " + emgCall.getPaidAmount());
		
		System.out.println("bookEmg() paidAmount : " + paidAmount);
				
		String impUid = request.getParameter("impUid");
		
		System.out.println(impUid);
		
		emgCall = callService.selectEmgCallWithDogs(callNo);
		
		emgCall.setPaidAmount(paidAmount);
		
		log.info("bookEmg() emgCall : " + emgCall.toString());
				
		model.addObject("emgCall", emgCall);
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
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			ModelAndView model) {
		
		System.out.println("cancel() call.paidAmount : " + call.getPaidAmount());
		
		System.out.println("cancel() paidAmount : " + paidAmount);

		callService.updateCall(call.getCallNo());
		
		log.info(payment.toString());
		
		callService.updateCall(call.getCallNo());

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

		call.setPaidAmount(paidAmount);
		
		model.addObject("call", call);

		model.setViewName("call/book_gn_cancel");

		return model;
	}
	
	// 긴급예약 취소
	@RequestMapping(value = "/book/emg/cancel", method = {RequestMethod.POST})
	public ModelAndView cancelEmg(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam(name = "pUserNo", required = true) String pUserNo,
			@RequestParam(value="paidAmount", required=true) int paidAmount,
			HttpServletRequest request, 
			@ModelAttribute EmgCall emgCall, 
			@ModelAttribute Payment payment,
			@RequestParam(value="impUid", required=true) String impUid,
			ModelAndView model) {
		
		int resultU = callService.updateCall(emgCall.getCallNo()); // GEN_CALL
				
		System.out.println("canceled resultU : " + resultU);
		
		System.out.println("canceled emgCallNo : " + emgCall.getCallNo());

		EmgCall emgCallToAdd = callService.selectEmgCallWithDogs(emgCall.getCallNo());
		
		String dUserNo = request.getParameter("dUserNo");
		
		System.out.println("String dUserNo : " + dUserNo);
		
		if (dUserNo != null && dUserNo != "") {
			Driver driver = driverService.selectDriverMember(Integer.parseInt(dUserNo));

			emgCallToAdd.setDriver(driver);
		}
		
		emgCallToAdd.setPaidAmount(paidAmount);
		
		model.addObject("emgCall", emgCallToAdd);
			
		log.info(emgCallToAdd.toString());

		model.setViewName("call/book_gn_cancel");

		return model;
	}
	
	// 긴급예약 신청 정보 입력 a
	@RequestMapping(value = "/book/emg_a", method = RequestMethod.GET)
	public ModelAndView bookEmg(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
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
	
	@RequestMapping(value = "/book/using/{userId}", method = RequestMethod.GET)
	public ModelAndView usingCallList(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {

		List<EmgCall> eUseCall = callService.useECallUserId(loginMember.getUserId());

		model.addObject("useCall", eUseCall);
		model.setViewName("call/useCallsList");
		
		return model;
	}

	@RequestMapping(value = "/book/cancel/{callNo}", method = RequestMethod.GET)
	public ModelAndView cancelCall(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(value = "callNo", required = false) int callNo,
			HttpServletRequest request,
			ModelAndView model) {
		int result = callService.updateCall(callNo);
		if (result > 0) {
			model.addObject("msg", "취소하였습니다");
			model.addObject("location", "/user/mypage");
		} else {
			model.addObject("msg", "취소하지못했습니다.");
			model.addObject("location", "/user/mypage");
		}
		model.setViewName("common/msg");

		return model;
	}

	@RequestMapping(value = "/book/listCancel/{callNo}", method = RequestMethod.GET)
	public ModelAndView listCancelCall(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(value = "callNo", required = false) int callNo, HttpServletRequest request,
			ModelAndView model) {
		int result = callService.updateCall(callNo);
		if (result > 0) {
			model.addObject("msg", "취소하였습니다");
			model.addObject("location", "/call/book/using/" + loginMember.getUserId());
		} else {
			model.addObject("msg", "취소하지못했습니다.");
			model.addObject("location", "/call/book/using/" + loginMember.getUserId());
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/book/end/{userId}", method = RequestMethod.GET)
	public ModelAndView endCallList(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {

		List<Call> endCall = callService.endCallUserId(loginMember.getUserId());

		model.addObject("endCall", endCall);
		
		model.setViewName("call/endCallsList");
		
		return model;
	}
	
	@RequestMapping(value = "/book/driverEnd", method = RequestMethod.GET)
	public ModelAndView driverEndCallList(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {
		List<Call> endCall = callService.driverEndCallList(loginMember.getUserNo());

		model.addObject("endCall", endCall);
		
		model.setViewName("call/endCallsList");
		
		return model;
	}
	
	
}
