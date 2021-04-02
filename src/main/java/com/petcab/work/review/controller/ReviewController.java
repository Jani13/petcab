package com.petcab.work.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.Review;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	// 리뷰 목록
	@RequestMapping(value = "/list", method = {RequestMethod.GET})
	public ModelAndView list (
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "1") int listLimit) {
		
		List<Review> list = null;
		int reviewCount = service.getReviewCount(); 
		PageInfo pageInfo = new PageInfo(page, 10, reviewCount, listLimit);
		
		System.out.println(reviewCount);
		
		list = service.getReviewList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/reviewList");
		
		return model;
	}
	
	// 리뷰 작성화면
	@RequestMapping(value = "/reviewWrite", method = {RequestMethod.GET})
	public void WriteView() {
		
	}
	
	// 게시글 작성처리
	@RequestMapping(value = "/reviewWrite", method = {RequestMethod.POST})
	public ModelAndView reviewrite(
		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
		HttpServletRequest request, Review review, ModelAndView model) {
		
		int result = 0;
		
		if (loginMember.getUserNo() == review.getUserNo()) {
			
			result = service.saveReview(review);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/review/list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/review/list");
			}
			
		}else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	
	
}
