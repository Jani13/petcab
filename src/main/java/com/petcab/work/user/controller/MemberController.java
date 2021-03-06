package com.petcab.work.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.Review;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.service.MemberService;
import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.NaverLoginBO;
import com.petcab.work.user.model.vo.Partner;

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

	@Autowired
	private DriverService driverService;

	@Autowired
	private PartnerService partnerService;

	// login
	@RequestMapping("/login")
	public ModelAndView loginView(ModelAndView model, HttpSession session) {

		String kakaoUrl = kakaoController.getAuthorizationUrl(session);
		model.addObject("kakaoUrl", kakaoUrl);

		model.setViewName("user/login");

		return model;
	}

	@RequestMapping(value = "/loginCheck", method = { RequestMethod.POST })
	public ModelAndView login(ModelAndView model, @RequestParam("userId") String userId,
			@RequestParam("userPwd") String userPwd) {

		log.info("{}, {}", userId, userPwd);

		Member loginMember = service.login(userId, userPwd);

		if (loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");

		} else {
			model.addObject("msg", "????????? ?????? ??????????????? ???????????? ????????????.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}

		return model;
	}

	@Transactional
	@RequestMapping(value = "/kakaoLogin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView model = new ModelAndView();
		
		Member loginMember = null;
		// ???????????? node??? ?????????
		JsonNode node = kakaoController.getAccessToken(code);
		// accessToken??? ???????????? ???????????? ?????? ????????? ????????????
		JsonNode accessToken = node.get("access_token");
		// ???????????? ??????
		System.out.println("????????? ?????? : " + accessToken);

		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken);

		// ???????????? ??????????????? ???????????? Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		String email = kakao_account.path("email").asText();
		String gender = kakao_account.path("gender").asText();

		System.out.println("????????? : " + email + "\n" + "?????? : " + gender);
		try {

			if (service.kakaoCheck(email) > 0) {// ????????? ??????????????? ??????

			} else {
				service.kakaoInsert(email); // ?????? ?????????
			}
			
			loginMember = service.kakaoLogin(email); // ????????? ?????????
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		model.addObject("loginMember", loginMember);
		model.setViewName("redirect:/");  
		// mav.addObject("page", "mainBody.jsp");

		return model;
	}

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// ????????? ??? ?????? ?????? ?????????
	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* ????????????????????? ?????? URL??? ???????????? ????????? naverLoginBO???????????? getAuthorizationUrl????????? ?????? */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("?????????:" + naverAuthUrl);
		// ?????????
		model.addAttribute("naverAuthUrl", naverAuthUrl);
		return "redirect:/";
	}

	// ????????? ????????? ????????? callback?????? ?????????
	@RequestMapping(value = "/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("????????? callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. ????????? ????????? ????????? ????????????.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String????????? json?????????
		/**
		 * apiResult json ?????? {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String????????? apiResult??? json????????? ??????
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. ????????? ??????
		// Top?????? ?????? _response ??????
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response??? nickname??? ??????
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		// 4.?????? ????????? ???????????? ??????
		session.setAttribute("sessionId", nickname); // ?????? ??????
		model.addAttribute("result", apiResult);
		return "user/login";
	}

	// ????????????
	@RequestMapping(value = "/naverLogout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("????????? logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

	// logout
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {

		status.setComplete();

		return "redirect:/";
	}

	// enroll
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

	@RequestMapping(value = "signup/Information", method = { RequestMethod.POST })
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {

		int result = service.saveMember(member);
		log.info(member.toString());
		if (result > 0) {
			model.addObject("loginMember", member);
			model.addObject("msg", "??????????????? ?????????????????????.");
			model.addObject("location", "/signup/Join");
		} else {
			model.addObject("msg", "??????????????? ?????????????????????.");
			model.addObject("location", "/signup/Information");
		}

		model.setViewName("common/msg");

		return model;
	}

	@ResponseBody
	@RequestMapping("/member/idCheck")
	public Object idCheck(@RequestParam("id") String userId) {
		log.info("UserId : {}", userId);

		Map<String, Object> map = new HashMap<>();

		map.put("validate", service.validate(userId));

		return map;
	}

	// findId findPwd
	@RequestMapping("/user/findIdPwd")
	public String findIdPwdView() {
		return "user/findIdPwd";
	}

	@RequestMapping("/user/successFindId")
	public String sucessFindIdView() {
		return "user/successFindId";
	}

	@RequestMapping("/user/findId/success")
	public ModelAndView searchId(@ModelAttribute Member member, ModelAndView model) {

		log.info(member.toString());

		Member result = service.searchMember(member.getUserName(), member.getPhone());

		if (result != null) {
			model.addObject("member", result);
			model.setViewName("user/successFindId");
		} else {
			model.addObject("msg", "???????????? ?????? ???????????????. ??????????????? ????????? ?????????.");
			model.addObject("location", "/user/findIdPwd");
			model.setViewName("common/msg");
		}
		return model;
	}

	@RequestMapping("/user/findPwd/success")
	public ModelAndView searchPwd(@ModelAttribute Member member, ModelAndView model) {

		log.info(member.toString());

		Member result = service.searchMemberPwd(member.getUserId(), member.getPhone());

		if (result != null) {
			model.addObject("member", result);
			model.setViewName("user/successFindPwd");
		} else {
			model.addObject("msg", "????????? ???????????? ????????????. ??????????????? ?????? ??? ?????????.");
			model.addObject("location", "/user/findIdPwd");
			model.setViewName("common/msg");
		}
		return model;
	}

	@RequestMapping(value = "/user/successFindPwd", method = { RequestMethod.POST })
	public ModelAndView updatePwd(ModelAndView model, @ModelAttribute Member member) {

		log.info(member.toString());

		int result = service.updatePwd(member);

		if (result > 0) {

			model.addObject("msg", "??????????????? ?????????????????????.");
			model.addObject("location", "/login");

		} else {
			model.addObject("msg", "????????? ??????????????????. ??????????????? ??????????????????.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");

		return model;
	}

	// userMyPage
	@RequestMapping("/user/mypage")
	public ModelAndView userMyPageView(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {
		List<Review> review = reviewServcie.searchUserNo(loginMember.getUserNo());
		
		List<Dog> dog = dogService.searchUserId(loginMember.getUserId());
		List<EmgCall> eUseCall = callService.useECallUserId(loginMember.getUserId());
		List<Call> endCall = callService.endCallUserId(loginMember.getUserId());

		log.info(dog.toString());
		log.info(endCall.toString());

		model.addObject("review", review);
		model.addObject("dog", dog);
		model.addObject("useCall", eUseCall);
		model.addObject("endCall", endCall);
		model.setViewName("user/userMyPage");

		return model;
	}

	@RequestMapping("/changePwd")
	public ModelAndView myPageChangePwd(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {

		log.info(loginMember.toString());

		Member member = service.findMemberByUserId(loginMember.getUserId());

		model.addObject("member", member);
		model.setViewName("user/successFindPwd");
		return model;
	}

	@RequestMapping(value = "/updateinfo", method = { RequestMethod.POST })
	public ModelAndView updateInfo(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Member member,
			HttpServletRequest request) {
		String address = request.getParameter("addr1") + "," + request.getParameter("addr2");
		int postCode = Integer.parseInt(request.getParameter("postalAddr"));

		member.setAddress(address);
		member.setPostCode(postCode);

		int result = 0;

		System.out.println("??????" + member.toString());
		result = service.updateMInfo(member);

		loginMember = service.findMemberByUserId(member.getUserId());

		if (result > 0) {
			model.addObject("msg", "????????? ?????????????????????.");
			model.addObject("loginMember", loginMember);
			model.addObject("location", "/");

		} else {
			model.addObject("msg", "????????? ??????????????????. ??????????????? ??????????????????.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");

		return model;
	}

	@RequestMapping("/user/delete")
	public ModelAndView delete(@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			ModelAndView model) {

		log.info(loginMember.toString());

		int result = service.deleteMember(loginMember.getUserId());

		if (result > 0) {
			model.addObject("msg", "?????? ???????????????.");
			model.addObject("location", "/logout");
			model.addObject("loginMember");
			
		} else {
			model.addObject("msg", "???????????? ???????????????. ??????????????? ??????????????????");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");

		return model;
	}
	
	@RequestMapping(value = "/user/mypage/myreview/{userId}", method = RequestMethod.GET)
	public ModelAndView myReviewList(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(name="userId") String userId,
			ModelAndView model) {
		
		List<Review> myReview = reviewServcie.myReviewUserId(userId);
		
		System.out.println("?????????????????????????????????1111111111111" + myReview.toString());
		
		model.addObject("review", myReview);
		model.setViewName("review/myReviewList");
		
		return model;
	}
	
	@RequestMapping(value = "/user/mypage/myDreview/{userNo}", method = RequestMethod.GET)
	public ModelAndView myDReviewList(
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@PathVariable(name="userNo") int userNo,
			ModelAndView model) {
		if (loginMember.getUserNo() != userNo) {
			userNo = loginMember.getUserNo();
		}
		List<Review> reviewList = reviewServcie.driverReviewList(userNo);			
		model.addObject("review", reviewList);
		model.setViewName("review/myReviewList");
		return model;
		
	}
}
