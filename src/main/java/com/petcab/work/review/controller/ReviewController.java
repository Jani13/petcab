package com.petcab.work.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
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
	@RequestMapping(value = "/list", method = { RequestMethod.GET })
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "listLimit", required = false, defaultValue = "10") int listLimit,
			@RequestParam(required = false, defaultValue = "userId")String searchType,
			@RequestParam(required = false) String keyword) {

		List<Review> list = null;
		int reviewCount = service.getReviewCount(null);
		Search search = new Search(page, 10, reviewCount, listLimit);
		list = service.getReviewList(search);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
		System.out.println(reviewCount);
		
		reviewCount = service.getReviewCount(search);
		list = service.getReviewList(search);

		search = new Search(page, 10, reviewCount, listLimit);
		
		if (keyword != null) {
			search.setSearchType(searchType);
			search.setKeyword(keyword);
		}
		
//		log.info(list.toString());
		model.addObject("list", list);
		model.addObject("pageInfo", search);
		model.setViewName("review/reviewList");
		
		return model;
	}

	@RequestMapping(value = "/reviewWrite", method = { RequestMethod.GET })
	public ModelAndView aaa(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("callNo") int callNo) {
		ModelAndView model = new ModelAndView();
		
//		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + callNo);
		
		Call call = new Call();
		
		call.setCallNo(callNo);
		
//		int callNo = Integer.parseInt(s);
		
//		call = callservice.callEndList(callNo);

		model.addObject(call);
		model.setViewName("/review/reviewWrite");
		
		return model;
	}

	// 게시글 작성처리
	@RequestMapping(value = "/reviewWriteResult", method = { RequestMethod.POST })
	public ModelAndView reviewWriteResult(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
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
		Call call = callservice.selectCall(callNo);

		review.setCallNo(callNo);
		review.setCallType(callType);
		review.setStarNo(starNo);
		review.setTitle(title);
		review.setContent(content);
		review.setUserNo(userNo);
		review.setSUserNo(call.getDriver().getUserNo());
		
		result = service.saveReview(review);
		if (result > 0) {
			
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
	@Transactional
	@RequestMapping(value = "/reviewView", method = { RequestMethod.GET })
	public ModelAndView view(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam(value = "listLimit", required = false, defaultValue = "100") int listLimit,
			@RequestParam("reviewNo") int reviewNo, ModelAndView model) {

		ArrayList<RReply> replyList = new ArrayList<RReply>();
		Review review = null;
		ArrayList<Integer> count = new ArrayList<Integer>();
		
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + reviewNo);
		try {
			replyList = reservice.getReplyList(reviewNo);
			
			
			
			service.updateViewNo(reviewNo);
			review = service.findreviewNo(reviewNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
			
		for(int i=0; i<replyList.size(); i++) {
			count.add(i);
		}
		
		model.addObject("replyList", replyList);
		model.addObject("review", review);
		model.addObject("loginMember", loginMember);
		model.setViewName("review/reviewView");

		return model;
	}

	// 게시글 수정하기
	@RequestMapping(value = "/update", method = { RequestMethod.GET })
	public ModelAndView updateView(@RequestParam("reviewNo") int reviewNo, ModelAndView model) {

		Review review = service.findreviewNo(reviewNo);

		model.addObject("review", review);
		model.setViewName("review/reviewUpdate");

		return model;
	}

	@RequestMapping(value = "/update", method = { RequestMethod.POST })
	public ModelAndView update(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			HttpServletRequest request, Review review, ModelAndView model) {

		System.out.println("aaaaaaaaaaaaaaaaaaaaaaa" + review.toString());
		
		int result = 0;

//			System.out.println("xxxxxxxxxxxxxxxxx" + review);
		if (loginMember.getUserNo() == review.getUserNo()) {
			result = service.saveReview(review);

			if (result > 0) {
				model.addObject("msg", "리뷰가 정상적으로 수정되었습니다.");
				model.addObject("location", "/review/reviewView?reviewNo=" + review.getReviewNo());

			} else {
				model.addObject("msg", "리뷰 수정을 실패하였습니다.");
				model.addObject("location", "/review/list");
			}

		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}

		model.setViewName("common/msg");

		return model;
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/delete", method = { RequestMethod.GET })
	public ModelAndView reviewDelete(@RequestParam("reviewNo") int reviewNo, ModelAndView model) {
		int result = 0;

		result = service.delete(reviewNo);
//			System.out.println("dddddddddddddddd" + reviewNo);
		if (result > 0) {
//				System.out.println("xxxxxxxxxxxxxxxxxxx" + reviewNo);
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
//				model.addObject("location", "/review/reviewView?reviewNo="+reviewNo);
			model.addObject("location", "/review/list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패하였습니다.");
			model.addObject("location", "/review/list");
		}

		model.setViewName("common/msg");

		return model;
	}
	
	// 댓글 작성
	@PostMapping("/reply")
	@ResponseBody
	public ResponseEntity<String> reply(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("reviewNo") int reviewNo, HttpServletRequest request, RReply rReply, ModelAndView model) {

		System.out.println("aaaaaa");
		
		rReply.setUserNo(loginMember.getUserNo());
		rReply.setUserId(loginMember.getUserId());
		int result = 0;
		String result2 = "";
		result = reservice.saveRReply(rReply);

		if (result > 0) {
			result2 += reviewNo;
		} else {
			result2 = "등록 실패";
		}

		return new ResponseEntity<>(result2, HttpStatus.OK);
	}
	
	// 댓글 수정
	@PostMapping("/updateReply")
	@ResponseBody
	public ResponseEntity<String> updateReply(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			 HttpServletRequest request, RReply rReply, ModelAndView model) {
		
		
		rReply.setUserNo(loginMember.getUserNo());
		rReply.setUserId(loginMember.getUserId());
		
		
		int result = 0;
		String result2 = "";
		result = reservice.updateReply(rReply);

		if (result > 0) {
			result2 += rReply.getReplyNo();;
		} else {
			result2 = "등록 실패";
		}

		return new ResponseEntity<>(result2, HttpStatus.OK);
	}
	
	// 댓글 삭제
		@PostMapping("/deleteReply")
		@ResponseBody
		public ResponseEntity<String> deleteReply(
				@SessionAttribute(name = "loginMember", required = false) Member loginMember,
				 HttpServletRequest request, RReply rReply, ModelAndView model) {
			
			
			rReply.setUserNo(loginMember.getUserNo());
			rReply.setUserId(loginMember.getUserId());
			
			
			int result = 0;
			String result2 = "";
			result = reservice.deleteReply(rReply);

			if (result > 0) {
				result2 += rReply.getReplyNo();;
			} else {
				result2 = "등록 실패";
			}

			return new ResponseEntity<>(result2, HttpStatus.OK);
		}
	
}
