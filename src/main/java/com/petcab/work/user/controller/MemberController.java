package com.petcab.work.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.Review;
import com.petcab.work.user.model.service.MemberService;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@Autowired
	private ReviewService reviewServcie;
	
	@Autowired
	private DogService dogService;
	
	@Autowired
	private CallService callService;
	//login
	@RequestMapping("/login")
	public String loginView() {
		
		return "user/login";
	}
	
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

	//logout
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}

	
	//enroll
	@RequestMapping("/signup/agreement")
	public String agreementView() {
		
		return "signup/agreement";
	}
	
	@RequestMapping("/signup/SubscriptionType")
	public String subTypeView() {
		
		return "signup/SubscriptionType";
	}
	
	@RequestMapping("/signup/Join")
	public String joinCompleteView() {
		
		return "signup/Join";
	}
	
	@RequestMapping(value = "signup/Information" , method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		int result = service.saveMember(member);
		log.info(member.toString());		
		if(result > 0) {
			
			model.addObject("msg", "회원가입이 완료되었습니다.");
			model.addObject("location", "/signup/Join");
		} else {
			model.addObject("msg", "회원가입에 실패하였습니다.");
			model.addObject("location", "/signup/Information");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@ResponseBody
	@RequestMapping("/member/idCheck")
	public Object idCheck(@RequestParam("id")String userId) {
		log.info("UserId : {}", userId);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(userId));

		return map;
	}
	
	//findId findPwd
	@RequestMapping("/user/findIdPwd")
	public String findIdPwdView() {
		return "user/findIdPwd";
	}
	
	@RequestMapping("/user/successFindId")
	public String sucessFindIdView() {
		return "user/successFindId";
	}
	
	@RequestMapping("/user/findId/success")
	public ModelAndView searchId(@ModelAttribute Member member
			,ModelAndView model) {
		
		log.info(member.toString());
		
		Member result = service.searchMember(member.getUserName(),member.getPhone());
		
		if (result != null) {
			model.addObject("member", result);
			model.setViewName("user/successFindId");
		} else {
			model.addObject("msg", "존재하지 않는 회원입니다.");
			model.addObject("location", "/user/findIdPwd");
			model.setViewName("common/msg");
		}
		return model;
	}

	
	@RequestMapping("/user/findPwd/success")
	public ModelAndView searchPwd(@ModelAttribute Member member
			,ModelAndView model) {
		
		log.info(member.toString());
		
		Member result = service.searchMemberPwd(member.getUserId(),member.getPhone());
		
		if (result != null) {
			model.addObject("member", result);
			model.setViewName("user/successFindPwd");
		} else {
			model.addObject("msg", "정보가 존재하지 않습니다. 회원가입을 진행 해 주세요.");
			model.addObject("location", "/user/findIdPwd");
			model.setViewName("common/msg");
		}
		return model;
	}

	@RequestMapping(value = "/user/successFindPwd", method = {RequestMethod.POST})
	public ModelAndView updatePwd(ModelAndView model, @ModelAttribute Member member) {
		
		log.info(member.toString());
		
		int result = service.updatePwd(member);
		
		if(result > 0) {
			
			model.addObject("msg", "비밀번호가 변경되었습니다.");
			model.addObject("location", "/login");
		
		} else {
			model.addObject("msg", "문제가 발생했습니다. 관리자에게 문의해주세요.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		
		return model;
	}
		
	//userMyPage
	@RequestMapping("/user/mypage")
	public ModelAndView userMyPageView(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		List<Review> review = reviewServcie.searchUserNo(loginMember.getUserNo());
		List<Dog> dog = dogService.searchUserId(loginMember.getUserId());
		List<Call> useCall = callService.useCallUserId(loginMember.getUserId());
		List<Call> endCall = callService.endCallUserId(loginMember.getUserId());
		
		log.info(dog.toString());
		log.info(useCall.toString());
		log.info(endCall.toString());

		model.addObject("review", review);
		model.addObject("dog", dog);
		model.addObject("useCall", useCall);
		model.addObject("endCall", endCall);
		model.setViewName("user/userMyPage");
		
		return model;



	}
	
}
