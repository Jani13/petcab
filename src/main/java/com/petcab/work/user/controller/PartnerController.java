package com.petcab.work.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

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
	
	// 파트너 등록 페이지
	@RequestMapping("/")
	public String partnerAppView() {
		
		return "partner/partner";
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
	@RequestMapping("/partHospital")
	public ModelAndView partSearchView(ModelAndView model, @SessionAttribute(name="pList", required = false) Partner partner) {
			
		List<Partner> partnerList = partnerService.ptListSearchYes();
		
		log.info(partnerList.toString());
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partHospital");
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
