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

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.ques.model.vo.QuesReply;
import com.petcab.work.review.model.service.RReplyService;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.RReply;
import com.petcab.work.review.model.vo.Review;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@Autowired
	private RReplyService reservice;
	
	@Autowired
	private CallService callservice;
	
	// 리뷰 목록
	@RequestMapping(value = "/list", method = {RequestMethod.GET})
	public ModelAndView list (
			ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit) {
		
		List<Review> list = null;
		int reviewCount = service.getReviewCount(); 
		
		System.out.println();
		
		PageInfo pageInfo = new PageInfo(page, 10, reviewCount, listLimit);
		
		
		System.out.println(reviewCount);
		
		list = service.getReviewList(pageInfo);
		
		log.info(list.toString());
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/reviewList");
		
		return model;
	}
	
	@RequestMapping(value = "/reviewWrite", method = {RequestMethod.GET})
	public String aaa() {
		
		return "/review/reviewWrite";
	}
	
	// 게시글 작성처리
	@RequestMapping(value = "/reviewWriteResult", method = {RequestMethod.POST})
	public ModelAndView reviewWriteResult(
		@SessionAttribute(name = "loginMember", required = false) Member loginMember,
		HttpServletRequest request, ModelAndView model) {
		
		// 예약과 연동하여 나중에 예약한 리스트로 리뷰 작성 내역을 선택하여 작성할 수 있도록 만들기
		
		int result = 0;
		Review review = new Review();
		
		int callNo = Integer.parseInt(request.getParameter("callNo"));
		String callType = request.getParameter("callType");
		int starNo = Integer.parseInt(request.getParameter("starNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("ir1");
		int userNo = loginMember.getUserNo();
		
//		System.out.println("asdasdasdsd"+userNo);
		
		review.setCallNo(callNo);
		review.setCallType(callType);
		review.setStarNo(starNo);
		review.setTitle(title);
		review.setContent(content);
		review.setUserNo(userNo);
			result = service.saveReview(review);
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/review/list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/review/list");
			}

		model.setViewName("common/msg");
		return model;
	}
	
	// 작성한 글 보기
	@RequestMapping(value = "/reviewView", method = {RequestMethod.GET})
	public ModelAndView view (@RequestParam("reviewNo") int reviewNo, ModelAndView model) {
		
		service.updateViewNo(reviewNo);
		Review review = service.findreviewNo(reviewNo);
		
		model.addObject("review", review);
		model.setViewName("review/reviewView");
		
		return model;
	}
	
	// 게시글 수정하기
		@RequestMapping(value = "/update", method = {RequestMethod.GET})
		public ModelAndView updateView(@RequestParam("reviewNo") int reviewNo, ModelAndView model) {
			
			Review review = service.findreviewNo(reviewNo);
			
			model.addObject("review", review);
			model.setViewName("review/reviewUpdate");
			
			return model;
		}
		
		@RequestMapping(value = "/update", method = {RequestMethod.POST})
		public ModelAndView update(
							@SessionAttribute(name = "loginMember", required = false) Member loginMember,
							HttpServletRequest request, Review review, ModelAndView model) {
			
			int result = 0;
			
//			System.out.println("xxxxxxxxxxxxxxxxx" + review);
			if(loginMember.getUserNo() == review.getUserNo()) {
				result = service.saveReview(review);
				
				if (result > 0) {
					model.addObject("msg", "리뷰가 정상적으로 수정되었습니다.");
					model.addObject("location", "/review/reviewView?reviewNo="+review.getReviewNo());

					} else {
					model.addObject("msg", "리뷰 수정을 실패하였습니다.");
					model.addObject("location", "/review/list");
				}
			
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location","/");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 게시글 삭제하기
		@RequestMapping(value = "/delete", method = {RequestMethod.GET})
		public ModelAndView reviewDelete(@RequestParam("reviewNo") int reviewNo,
				 ModelAndView model) {
			int result = 0;
			
			result = service.delete(reviewNo);
//			System.out.println("dddddddddddddddd" + reviewNo);
			if(result > 0) {
//				System.out.println("xxxxxxxxxxxxxxxxxxx" + reviewNo);
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
//				model.addObject("location", "/review/reviewView?reviewNo="+reviewNo);
				model.addObject("location", "/review/list");
			}else {
				model.addObject("msg", "게시글 삭제에 실패하였습니다.");
				model.addObject("location", "/review/list");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
	
		// 댓글 작성
		@RequestMapping(value = "/reply", method = {RequestMethod.POST})
		public ModelAndView replyWrite(
				@SessionAttribute(name="loginMember", required=false) Member loginMember,
			HttpServletRequest request, RReply rReply,
			 ModelAndView model) {
			
			int result = 0;
			
			result = reservice.saveRReply(rReply);
			
			if(result > 0) {
				model.addObject("msg", "답글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/review/reviewView");
			} else {
				model.addObject("msg", "답글 등록을 실패하였습니다.");
				model.addObject("location", "/review/list");
			}
			
			model.setViewName("common/msg");
			
			return model;
		}
		
		// 댓글 리스트
		/**
		 * @param currentPage 현재 클릭한 페이지
		 * @param pagelimit 한 페이지에 보여질 페이지의 수 (밑에 나타나는 숫자 현재 10개씩)
		 * @param listCount 전체 리스트 수
		 * @param listLimit 한 페이지에 표시될 게시글 수(현재 게시글 목록 5개) : 
		 */
		@RequestMapping(value = "/replyList", method = {RequestMethod.GET})
		public ModelAndView replyList(@RequestParam(value = "listLimit", 
										required = false, defaultValue = "100") int listLimit,
				ModelAndView model) {
			
//			List<RReply> replyList = reservice.replyList(replyNo);
			List<RReply> replyList = null;
			
			replyList = reservice.getReplyList(listLimit);
			
			model.addObject("replyList", replyList);
			model.setViewName("review/reviewView");
			
			return model;
		}

//			System.out.println(reviewCount);
//			
//			list = service.getReviewList(pageInfo);
//			
//			log.info(list.toString());
//			model.addObject("list", list);
//			model.addObject("pageInfo", pageInfo);
//			model.setViewName("review/reviewList");
//			
//			return model;
//		}
		
}





