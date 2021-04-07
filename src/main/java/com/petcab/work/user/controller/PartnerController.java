package com.petcab.work.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.user.model.service.MemberService;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner")
public class PartnerController {
	@Autowired
	private PartnerService partnerService;
	@Autowired
	private CallService callService;
	
	@Autowired
	private MemberService memberService;
	
	// 파트너 등록 페이지
	@RequestMapping("/")
	public ModelAndView partnerAppView(ModelAndView model,
			@SessionAttribute(name="loginMember", required = false )Member loginMember) {
		
		log.info(loginMember.toString());
		
		Partner partner = partnerService.selectPartner(loginMember.getUserNo());
		
		if(partner != null) {
			if(partner.getStatus().equals("W")) {
				model.setViewName("partner/partner");
				
			} else if (partner.getStatus().equals("N")) {
				model.addObject("msg", "업체승인이 거절된 업체입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
				
			} else {
				model.addObject("msg", "이미 업체승인이 완료되었습니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			}
		} 
		
		return model;
	}
	
	@RequestMapping(value = "/partApply", method = {RequestMethod.POST})
	public ModelAndView partApply(ModelAndView model, @ModelAttribute Partner partner) {
		
		int result = partnerService.savePartner(partner);
		
		log.info(partner.toString());
		
		if(result > 0) {
			model.addObject("msg", "파트너 등록 요청에 성공했습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "파트너 등록 요청에 실패했습니다. 다시 시도해 주세요.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 제휴 업체 검색 페이지
	@RequestMapping("/partnerMain")
	public String partnerMainView() {
		
		return "partner/partnerMain";
	}
	
	@RequestMapping(value = "/partHospital", method = {RequestMethod.GET})
	public ModelAndView partHospitalView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchHospital();
		
		log.info(partnerList.toString());
		
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partHospital");
		
		return model;
	}
	
	@RequestMapping(value = "/partKindergarten")
	public ModelAndView partKindergardenView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchKinderGarten();
		
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partKindergarden");
		
		return model;
	}
	
	@RequestMapping(value = "/partShop")
	public ModelAndView partShopView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchShop();
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partShop");
		return model;
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView partnerMypage(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		Partner partner = partnerService.selectPartner(loginMember.getUserNo());
		List<Call> waitCall = callService.waitECallList(loginMember.getUserNo());
		List<Call> eCallList = callService.eCallList(loginMember.getUserNo());
		
		log.info(waitCall.toString());
		log.info(eCallList.toString());
		model.addObject("partner",partner);
		model.addObject("waitCall",waitCall);
		model.addObject("eCallList",eCallList);
		model.setViewName("mypage/partMyPage");
		return model;
	}
	
	
}
