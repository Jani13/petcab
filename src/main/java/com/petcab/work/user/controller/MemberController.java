package com.petcab.work.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.user.model.service.MemberService;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember = service.login(userId, userPwd);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
			
		} else {
			model.addObject("msg", "아이디 또는 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@RequestMapping("/login")
	public String loginView() {
		
		return "user/login";
	}
	

	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}

	@RequestMapping("/signup/agreement")
	public String agreementView() {
		
		return "signup/agreement";
	}
	
	@RequestMapping("/signup/SubscriptionType")
	public String subTypeView() {
		
		return "signup/SubscriptionType";
	}
	
	
	@RequestMapping(value = "signup/Information" , method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		int result = service.saveMember(member);
		
		if(result > 0) {
			
			model.addObject("msg", "회원가입이 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입에 실패하였습니다.");
			model.addObject("location", "/signup/Information");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping("/user/userMyPage")
	public String userMyPageView() {
		return "user/userMypage";
	}
	
	
}
