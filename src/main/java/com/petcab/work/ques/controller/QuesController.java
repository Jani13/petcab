package com.petcab.work.ques.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.ques.model.vo.QuesReply;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ques")
public class QuesController {
	@Autowired
	private QuesService service;
	
	@RequestMapping(value="/list", method={RequestMethod.GET})
	public ModelAndView list(
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		List<Ques> list = null;
		int quesCount = service.getQuesCount();
//		PageInfo pageInfo = new PageInfo(page, 10, 100, listLimit);
		PageInfo pageInfo = new PageInfo(page, 10, quesCount, listLimit);
		
		
		System.out.println(quesCount);
		
		list = service.getQuesList(pageInfo);
		
		log.info(list.toString());
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("ques/quesList");
		
		return model;
	}
	
	@RequestMapping(value="/write", method={RequestMethod.GET})
	public String writeView() {		
		
		return "/ques/quesWrite";
	}
	
	@RequestMapping(value="/write", method={RequestMethod.POST})
	public ModelAndView write(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request, Ques ques,
			 ModelAndView model) {
		
		int result = 0;
//		int userNo = loginMember.getUserNo();
		
		System.out.println(ques);

		if (loginMember.getUserNo() == ques.getUserNo()) {
			
			result = service.saveQues(ques);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/ques/list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/ques/list");
			}
			
		}else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
		
	}
	
	@RequestMapping(value="/reply", method={RequestMethod.POST})
	public ModelAndView write(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request, QuesReply reply,
			 ModelAndView model) {
		
		int result = 0;

		if (loginMember.getUserType().equals("ROLE_ADMIN")) {
			
			result = service.saveQuesReply(reply);
			
			if(result > 0) {
				model.addObject("msg", "답글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/ques/list");
			} else {
				model.addObject("msg", "답글 등록을 실패하였습니다.");
				model.addObject("location", "/ques/list");
			}
			
		}else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
		
	}

	@RequestMapping(value = "/view", method = {RequestMethod.GET})
	public ModelAndView view(@RequestParam("quesNo") int quesNo, ModelAndView model) {
		
		service.updateViewNo(quesNo);
		Ques ques = service.findQuesByNo(quesNo);

		model.addObject("ques", ques);
		model.setViewName("ques/quesView");
		
		return model;
	}
	
	
	@RequestMapping(value = "/update", method = {RequestMethod.GET})
	public ModelAndView updateView(@RequestParam("quesNo") int quesNo, ModelAndView model) {
		
	
		Ques ques = service.findQuesByNo(quesNo);
		
		model.addObject("ques", ques);
		model.setViewName("ques/quesUpdate");
		
		return model;
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.POST})
	public  ModelAndView update(
					@SessionAttribute(name = "loginMember", required = false) Member loginMember,
					HttpServletRequest request,
					Ques ques, ModelAndView model) {
		
		int result = 0;
		
		if(loginMember.getUserNo() == ques.getUserNo()) {
			
			
			
			result = service.saveQues(ques);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/list");
			}else {
				model.addObject("msg", "게시글 수정이 실패하였습니다.");
				model.addObject("location", "/list");
			}
			
		}else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.GET})
	public ModelAndView QuesDelete(@RequestParam("quesNo") int quesNo, ModelAndView model) {
		int result = 0;
		
		Ques ques = service.delete(quesNo);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/list");
		}else {
			model.addObject("msg", "게시글 삭제에 실패하였습니다.");
			model.addObject("location", "/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
		
	}
	

}