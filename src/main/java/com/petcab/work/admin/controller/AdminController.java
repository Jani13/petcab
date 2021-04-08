package com.petcab.work.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.service.MemberService;

import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

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
	
	
	@RequestMapping(value = "/adminMain", method = {RequestMethod.GET})
	public ModelAndView adminMainView(ModelAndView model) {
		
		int memberCount = service.getMemberCount();
		int amountAll = paymentService.selectAmount();
		int allCall = callService.selectAllCall();
		int genCall = callService.selectGenCall();
		int emergCall = callService.selectEmergCall();
		int cancelledCall = callService.selectCancelledCall();
		List<Ques> list = quesService.getQuesListForAdmin();
		
		System.out.println("총 회원수 : " + memberCount);
		
		model.addObject("memberCount", memberCount);
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
		int quesCount = service.getMemberCount();
		PageInfo pageInfo = new PageInfo(page, 5, quesCount, listLimit);
				
		memberList = service.selectAllMember(pageInfo);
		
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

		/*
		 * List<Driver> driverList = null; int quesCount = service.getDriverCount();
		 * PageInfo pageInfo = new PageInfo(page, 5, quesCount, listLimit);
		 * 
		 * driverList = service.rNumSelectAllDriver(pageInfo);
		 * 
		 * log.info(driverList.toString());
		 * 
		 * model.addObject("driverList", driverList); model.addObject("pageInfo",
		 * pageInfo); model.setViewName("admin/adminUserInfoMain");
		 */
		
		
		return model;
	}

	@RequestMapping(value = "/info/user", method = RequestMethod.GET)
	public String infoUser() {

		return "admin/adminUserInfoUser";
	}
	@RequestMapping(value = "/info/partner", method = RequestMethod.GET)
	public String infoCompany() {

		return "admin/adminUserInfoPartner";
	}
	@RequestMapping(value = "/call/normal", method = RequestMethod.GET)
	public String callNormal() {

		return "admin/adminCallinfo";
	}@RequestMapping(value = "/call/emergency", method = RequestMethod.GET)
	public String callEmergency() {

		return "admin/adminCallEminfo";
	}@RequestMapping(value = "/call/cancel", method = RequestMethod.GET)
	public String callCancel() {

		return "admin/adminCallCancel";
	}
	
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public String payReview() {

		return "admin/adminPayReview";
	}@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public String apply() {

		return "admin/adminApply";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/apply/driver", method = RequestMethod.GET)
	public ModelAndView applyDriver(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model){
		List<Driver> waitDrivers = driverService.selectWaitDrivers();
		List<Driver> drivers =  driverService.selectDrivers();
		
		log.info(waitDrivers.toString());
		log.info(drivers.toString());

		model.addObject("waitDrivers",waitDrivers);
		model.addObject("drivers",drivers);
		model.setViewName("admin/adminApplyDriver");

		return model;
	}

	@RequestMapping(value = "/apply/partner", method = RequestMethod.GET)
	public ModelAndView applyPartner(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {
		List<Driver> waitDrivers = driverService.selectWaitDrivers();
		List<Driver> drivers = driverService.selectDrivers();

		log.info(waitDrivers.toString());
		log.info(drivers.toString());

		model.addObject(waitDrivers);
		model.addObject(drivers);
		model.setViewName("admin/adminApplyDriver");

		return model;
	}

}
