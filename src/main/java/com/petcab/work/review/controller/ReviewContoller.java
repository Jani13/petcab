package com.petcab.work.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reivew")
public class ReviewContoller {
//	@RequestMapping(value = "reviewList", method = {RequestMethod.GET})
//	public ModelAndView list (
//			ModelAndView model,
//			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
//			@RequestParam(value = "listLisit", required = false, defaultValue = "1") int listLimit) {
//		
//		List<Review> list = null;
//		int reviewCount = service.getReviewCount(); 
//		PageInfo pageInfo = new PageInfo(page, 10, reviewCount, listLimit);
//		
//		System.out.println(reviewCount);
//		
//		list = service.getReviewList(pageInfo);
//		
//		model.addOject("reviewList", reviewList);
//		
//	}
//			) {
//		
//	}
}
