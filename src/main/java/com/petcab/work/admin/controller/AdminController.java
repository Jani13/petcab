package com.petcab.work.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.user.model.service.MemberService;

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
	public String infoMain() {

		return "admin/adminUserInfoMain";
	}
	
	@RequestMapping(value = "/info/driver", method = RequestMethod.GET)
	public String infoDriver() {

		return "admin/adminUserInfoDriver";
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
	}@RequestMapping(value = "/apply/driver", method = RequestMethod.GET)
	public String applyDriver() {

		return "admin/adminApplyDriver";
	}@RequestMapping(value = "/apply/partner", method = RequestMethod.GET)
	public String applyPartner() {

		return "admin/adminApplyPartner";
	}

}
