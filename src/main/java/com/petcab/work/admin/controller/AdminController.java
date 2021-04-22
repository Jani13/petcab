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
import com.petcab.work.common.util.Search;
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.payment.model.vo.Payment;
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

import lombok.val;
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
		
		int memberCount = service.getMemberCount(null);
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
			@RequestParam(value="listLimit", required = false, defaultValue = "5")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {
		
		List<Member> memberList = null;
		int memberCount = service.getMemberCount(null);
		Search search = new Search(page, 5, memberCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		memberCount = service.getMemberCount(search);
		memberList = service.selectAllMember(search);
		
		search = new Search(page, 5, memberCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}

		log.info(memberList.toString());
		log.info("123123"+search.toString());
		
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
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminUserInfoMain");
		
		return model;
	}
	
	@RequestMapping(value = "/info/driver", method = RequestMethod.GET)
	public ModelAndView infoDriver(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {

		List<Driver> driverList = null; 
		int driverCount = driverService.getDriverCount(null);
		Search search = new Search(page, 5, driverCount, listLimit);
		  
		driverList = driverService.rNumSelectDrivers(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		driverCount = driverService.getDriverCount(search);
		driverList = driverService.rNumSelectDrivers(search);
		
		search = new Search(page, 5, driverCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		  
		model.addObject("driverList", driverList);
		model.addObject("pageInfo", search); 
		model.setViewName("admin/adminUserInfoDriver");
		 	
		return model;
	}

	@RequestMapping(value = "/info/user", method = RequestMethod.GET)
	public ModelAndView infoUser(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {
		
		List<Member> onlyUserList = null;
		int onlyUserCount = service.getUserCount(null);
		Search search = new Search(page, 5, onlyUserCount, listLimit);
		
		onlyUserList = service.selectAllUsers(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		onlyUserCount = service.getUserCount(search);
		onlyUserList = service.selectAllUsers(search);
		
		search = new Search(page, 5, onlyUserCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		model.addObject("onlyUserList", onlyUserList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminUserInfoUser");
		
		return model;
	}
	
	@RequestMapping(value = "/info/partner", method = RequestMethod.GET)
	public ModelAndView infoCompany(ModelAndView model,
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "partnerName")String searchType,
			@RequestParam(required = false) String keyword) {
		
		List<Partner> partnerList = null;
		int partnerCount = partnerService.getPartnerCount(null);
		Search search = new Search(page, 5, partnerCount, listLimit);
		
		partnerList = partnerService.selectPartners(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		System.out.println("searchType : " + searchType + "keyword : " +keyword);
		partnerCount = partnerService.getPartnerCount(search);
		partnerList = partnerService.selectPartners(search);
		search = new Search(page, 5, partnerCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		
		model.addObject("partnerList", partnerList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminUserInfoPartner");
		
		return model;
	}
	
	@RequestMapping(value = "/call/normal", method = RequestMethod.GET)
	public ModelAndView callNormal(ModelAndView model, 
			@RequestParam(value ="page" , required = false, defaultValue="1") int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {

		List<Call> callList = null;
		int callCount = callService.searchGenCallCount(null);
		Search search = new Search(page, 5, callCount, listLimit);
		
		callList = callService.selectGenCallList(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		callCount = callService.searchGenCallCount(search);
		callList = callService.selectGenCallList(search);
		search = new Search(page, 5, callCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		log.info(callList.toString());
		model.addObject("callList", callList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminCallinfo");
		
		return model;	
	}
	
	@RequestMapping(value = "/call/emergency", method = RequestMethod.GET)
	public ModelAndView callEmergency(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1")int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {

		List<Call> emgCallList = null;
		int emgCallCount = callService.searchEmgCallCount(null);
		Search search = new Search(page, 5, emgCallCount, listLimit);
		
		emgCallList = callService.selectEmgCallList(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		emgCallCount = callService.searchEmgCallCount(search);
		emgCallList = callService.selectEmgCallList(search);
		search = new Search(page, 5, emgCallCount, listLimit);
	
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		log.info(emgCallList.toString());
		model.addObject("emgCallList", emgCallList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminCallEminfo");
		
		return model;
	}
	
	@RequestMapping(value = "/call/cancel", method = RequestMethod.GET)
	public ModelAndView callCancel(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1")int page,
			@RequestParam(value="listLimit", required = false, defaultValue = "10")int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {
		
		List<Call> cancelCallList = null;
		int cancelCallCount = callService.searchCancelCount(null);
		Search search = new Search(page, 5, cancelCallCount, listLimit);
		
		cancelCallList = callService.getCancelCallList(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		cancelCallCount = callService.searchCancelCount(search);
		cancelCallList = callService.getCancelCallList(search);
		search = new Search(page, 5, cancelCallCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		log.info(cancelCallList.toString());
		model.addObject("cancelCallList",cancelCallList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminCallCancel");
		
		return model;
	}
	
	
	
	
	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public ModelAndView payReview(ModelAndView model, 
								  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
								  @RequestParam(value="listLimit", required = false, defaultValue = "10") int listLimit,
								  @RequestParam(required = false, defaultValue = "userId") String searchType,
								  @RequestParam(required = false) String searchType2,
								  @RequestParam(required = false) String keyword) {
		
		List<Payment> paymentList = null;
		int payCount = paymentService.searchPayCount(null);
		Search search = new Search(page, 5, payCount, listLimit);
		
		paymentList = paymentService.searchPayList(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
			search.setSearchType2(searchType2);
		}
		
		log.info(paymentList.toString());
		
		payCount = paymentService.searchPayCount(search);
		paymentList = paymentService.searchPayList(search);
		search = new Search(page, 5, payCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
			search.setSearchType2(searchType2);
		}
		
		System.out.println(searchType2);
		
		model.addObject("paymentList", paymentList);
		model.addObject("pageInfo", search);
		model.setViewName("admin/adminPayReview");
		
		return model;
	}
	
	@RequestMapping(value = "/genCallSelect", method = {RequestMethod.GET})
	@ResponseBody
	public ResponseEntity<List<Payment>> findGenPayList(@RequestParam(name = "btnValue", required=false)String btnValue) {
	
		List<Payment> selectList = paymentService.searchByCallType(btnValue);
				
		return new ResponseEntity<List<Payment>>(selectList, HttpStatus.OK);
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
		int result = service.applyDriver(userNo);
					
		if (result > 0) {
			model.addObject("msg", "승인하였습니다");
			model.addObject("location", "/admin/apply/driver");
		}else {
			model.addObject("msg", "승인하지못했습니다.");
			model.addObject("location", "/admin/apply/driver");
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/driver/revoke", method = RequestMethod.GET)
	public ModelAndView driverRevoke(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("userNo") int userNo,
			ModelAndView model){
		int result = driverService.rejectDriver(userNo);
					
		if (result > 0) {
			model.addObject("msg", "거절하였습니다");
			model.addObject("location", "/admin/apply/driver");
		}else {
			model.addObject("msg", "거절하지못했습니다.");
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
		
		int result = service.applyPartner(userNo);
		
		if (result > 0) {
			model.addObject("msg", "승인하였습니다");
			model.addObject("location", "/admin/apply/partner");
		}else {
			model.addObject("msg", "승인하지못했습니다.");
			model.addObject("location", "/admin/apply/partner");
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/partner/revoke", method = RequestMethod.GET)
	public ModelAndView partnerRevoke(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("userNo") int userNo,
			ModelAndView model){
		
		int result = partnerService.rejectPartner(userNo);
		
		if (result > 0) {
			model.addObject("msg", "거절하였습니다");
			model.addObject("location", "/admin/apply/partner");
		}else {
			model.addObject("msg", "거절하지못했습니다.");
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
