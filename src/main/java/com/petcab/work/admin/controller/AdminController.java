package com.petcab.work.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.service.MemberService;

import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;
import com.petcab.work.visit.model.dao.VisitCountDao;
import com.petcab.work.visit.model.service.VisitorService;
import com.petcab.work.visit.model.vo.VisitCountVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private PaymentService paymentService;

	@Autowired
	private CallService callService;
	
	@Autowired
	private QuesService quesService;

	@Autowired
	private DriverService driverService;

	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private VisitorService visitorService;
	
	
	@RequestMapping(value = "/adminMain", method = {RequestMethod.GET})
	public ModelAndView adminMainView(ModelAndView model) {
		
		int memberCount = service.getMemberCount();
		int todayVisitorCount = visitorService.getVisitorCount();
		int amountAll = paymentService.selectAmount();
		int allCall = callService.selectAllCall();
		int genCall = callService.selectGenCall();
		int emergCall = callService.selectEmergCall();
		int cancelledCall = callService.selectCancelledCall();
		
		List<Ques> list = quesService.getQuesListForAdmin();
		
		System.out.println("총 회원수 : " + memberCount);
		System.out.println(todayVisitorCount);
		
		model.addObject("memberCount", memberCount);
		model.addObject("todayVisitorCount", todayVisitorCount);
		model.addObject("amountAll", amountAll);
		model.addObject("allCall", allCall);
		model.addObject("genCall", genCall);
		model.addObject("emergCall", emergCall);
		model.addObject("cancelledCall", cancelledCall);
		model.addObject("list", list);
		model.setViewName("admin/adminMain");
		
		return model;
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public ModelAndView infoMain(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit){
		
		List<Member> memberList = null;
		int memberCount = service.getMemberCount();
		PageInfo pageInfo = new PageInfo(page, 5, memberCount, listLimit);
			
		memberList = service.selectAllMember(pageInfo);

		log.info(memberList.toString());
		
		// 콜 차트 관련 내용 ---------------------------
		int genCallList = callService.selectGenCall();
		int emgCallList = callService.selectEmergCall();
		
		String callStr = "['callType', 'count'],";
		callStr += "['일반콜',";
		callStr += genCallList;
		callStr += "],";
		callStr += "['긴급콜',";
		callStr += emgCallList;
		callStr += "]";
		
		// 카테고리별 제휴업체 차트 내용 ---------------------
		List<Partner> pChartList = partnerService.getpChartList();
		List<Partner> pChartCount = partnerService.getpChartCount();
		// -----------------------------------------
		
		model.addObject("pChartCount",pChartCount);
		model.addObject("pChartList",pChartList);
		model.addObject("genCallList", genCallList);
		model.addObject("emgCallList", emgCallList);		
		model.addObject("callStr", callStr);
		model.addObject("memberList", memberList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminUserInfoMain");
		
		return model;
	}
	
	@RequestMapping(value="/info/search", method = {RequestMethod.GET})
	public ModelAndView infoMainSearch(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "5") int listLimit,
			@RequestParam(defaultValue = "userId") String searchOption,
			@RequestParam(defaultValue = "") String keyword, 
			HttpServletRequest request) {
		
		System.out.println(request.getParameter("searchOption"));
		System.out.println("keyword : " + request.getParameter("keyword"));
		
		List<Member> memberList =null;
		int memberCount = service.getMemberCount();
		
		PageInfo pageInfo = new PageInfo(page, 5, memberCount, listLimit);
		
		memberList = service.getSearchMember(pageInfo, searchOption, keyword);
		
		log.info(memberList.toString());
		
		model.addObject("memberList", memberList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminUserInfoMain");
		
		return model;
	}
	
	@RequestMapping(value = "/info/driver", method = RequestMethod.GET)
	public ModelAndView infoDriver(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {

		List<Driver> driverList = null; 
		int driverCount = driverService.getDriverCount();
		PageInfo pageInfo = new PageInfo(page, 5, driverCount, listLimit);
		  
		driverList = driverService.rNumSelectDrivers(pageInfo);
		
		log.info(driverList.toString());
		  
		model.addObject("driverList", driverList);
		model.addObject("pageInfo",pageInfo); 
		model.setViewName("admin/adminUserInfoDriver");
		 	
		return model;
	}

	@RequestMapping(value = "/info/user", method = RequestMethod.GET)
	public ModelAndView infoUser(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {
		
		List<Member> onlyUserList = null;
		int onlyUserCount = service.getUserCount();
		PageInfo pageInfo = new PageInfo(page, 5, onlyUserCount, listLimit);
		
		onlyUserList = service.selectAllUsers(pageInfo);
		
		model.addObject("onlyUserList", onlyUserList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminUserInfoUser");
		
		return model;
	}
	
	@RequestMapping(value = "/info/partner", method = RequestMethod.GET)
	public ModelAndView infoCompany(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {
		
		List<Partner> partnerList = null;
		int partnerCount = partnerService.getPartnerCount();
		PageInfo pageInfo = new PageInfo(page, 5, partnerCount, listLimit);
		
		partnerList = partnerService.selectPartners(pageInfo);
		
		log.info(partnerList.toString());
		
		model.addObject("partnerList", partnerList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminUserInfoPartner");
		
		return model;
	}
	
	@RequestMapping(value = "/call/normal", method = RequestMethod.GET)
	public ModelAndView callNormal(ModelAndView model, 
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {

		List<Call> callList = null;
		int callCount = callService.selectGenCall();
		PageInfo pageInfo = new PageInfo(page, 5, callCount, listLimit);
		
		callList = callService.selectGenCallList(pageInfo);
		
		log.info(callList.toString());
		model.addObject("callList", callList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminCallinfo");
		
		return model;	
	}
	
	@RequestMapping(value = "/call/emergency", method = RequestMethod.GET)
	public ModelAndView callEmergency(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1")int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {

		List<Call> emgCallList = null;
		int emgCallCount = callService.selectEmergCall();
		PageInfo pageInfo = new PageInfo(page, 5, emgCallCount, listLimit);
		
		emgCallList = callService.selectEmgCallList(pageInfo);
		
		log.info(emgCallList.toString());
		model.addObject("emgCallList", emgCallList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminCallEminfo");
		
		return model;
	}
	
	@RequestMapping(value = "/call/cancel", method = RequestMethod.GET)
	public ModelAndView callCancel(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1")int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit) {
		
		List<Call> cancelCallList = null;
		int cancelCallCount = callService.selectCancelledCall();
		PageInfo pageInfo = new PageInfo(page, 5, cancelCallCount, listLimit);
		
		cancelCallList = callService.getCancelCallList(pageInfo);
		
		log.info(cancelCallList.toString());
		model.addObject("cancelCallList",cancelCallList);
		model.addObject("pageInfo",pageInfo);
		model.setViewName("admin/adminCallCancel");
		
		return model;
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String payReview() {

		return "admin/adminPayReview";
	}
	
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String apply() {

		return "admin/adminApply";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/apply/driver", method = RequestMethod.GET)
	public ModelAndView applyDriver(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "5") int listLimit){
		
		List<Driver> waitDrivers = driverService.selectWaitDrivers();
		List<Driver> rejectDrivers = null;
		
		int driversCount = driverService.getRejectDriverCount();
		PageInfo pageInfo = new PageInfo(page, 5, driversCount, listLimit);
		
		rejectDrivers = driverService.selectRejectDrivers(pageInfo);

		log.info(waitDrivers.toString());
		log.info(rejectDrivers.toString());

		model.addObject("waitDrivers",waitDrivers);
		model.addObject("pageInfo",pageInfo); 
		model.addObject("rejectDrivers",rejectDrivers);
		model.setViewName("admin/adminApplyDriver");

		return model;
	}

	@RequestMapping(value = "/driver/grant", method = RequestMethod.GET)
	public ModelAndView driverGrant(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("userNo") int userNo,
			ModelAndView model){
		
		int result = driverService.applyDriver(userNo);
		int result2 = service.applyDriver(userNo);
					
		if (result > 0 && result2 > 0) {
			model.addObject("msg", "승인하였습니다");
			model.addObject("location", "/admin/apply/driver");
		}else {
			model.addObject("msg", "승인하지못했습니다.");
			model.addObject("location", "/admin/apply/driver");
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/apply/partner", method = RequestMethod.GET)
	public ModelAndView applyPartner(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "5") int listLimit) {

		List<Partner> waitPartners = partnerService.selectWaitPartners();
		List<Partner> rejectPartners = null;
		
		int partnersCount = partnerService.getRejectPartnerCount();
		PageInfo pageInfo = new PageInfo(page, 5, partnersCount, listLimit);
		
		rejectPartners = partnerService.selectRejectPartners(pageInfo);

		log.info(waitPartners.toString());
		log.info(rejectPartners.toString());

		model.addObject("waitPartners",waitPartners);
		model.addObject("pageInfo",pageInfo); 
		model.addObject("rejectPartners",rejectPartners);
		model.setViewName("admin/adminApplyPartner");

		return model;
	}
	
	@RequestMapping(value = "/partner/grant", method = RequestMethod.GET)
	public ModelAndView partnerGrant(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("userNo") int userNo,
			ModelAndView model){
		
		int result = partnerService.applyPartner(userNo);
		int result2 = service.applyPartner(userNo);
		
		if (result > 0 && result2 > 0) {
			model.addObject("msg", "승인하였습니다");
			model.addObject("location", "/admin/apply/partner");
		}else {
			model.addObject("msg", "승인하지못했습니다.");
			model.addObject("location", "/admin/apply/partner");
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/joinChart", method = RequestMethod.GET)
	@ResponseBody 
	public ResponseEntity<List<Member>> joinChart() {
		
		List<Member> dateAndCount = service.getChartDateCount(); 
		
		return new ResponseEntity<List<Member>>(dateAndCount, HttpStatus.OK); 
	}
	
	@RequestMapping(value = "/visitChart", method = RequestMethod.GET)
	public ResponseEntity<List<VisitCountVo>> visitorChart() {
		
		List<VisitCountVo> visitDateCount = visitorService.getChartVisitCount();
		
		System.out.println(visitDateCount);
		
		return new ResponseEntity<List<VisitCountVo>>(visitDateCount, HttpStatus.OK);
	}
	
	

}
