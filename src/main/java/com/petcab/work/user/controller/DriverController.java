package com.petcab.work.user.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.review.model.service.ReviewService;
import com.petcab.work.review.model.vo.Review;
import com.petcab.work.user.model.service.DriverService;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/driver")
public class DriverController {

	@Autowired
	private DriverService service;
	
	@Autowired
	private CallService callService;
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dirverApply() {
		
		return "driver/driverApply";
	}
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public ModelAndView dirverDocument(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		log.info(loginMember.toString());
		Driver driver = service.selectDriver(loginMember.getUserNo());

		if (driver != null) {
			if(driver.getStatus().equals("W")) {
				model.addObject("msg", "승인 대기 중인 회원입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");	
			}else if(driver.getStatus().equals("N")){
				model.addObject("msg", "승인 거절된 드라이버 회원입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			}else {	
				model.addObject("driver", driver);
				model.setViewName("driver/driverDocument");
			}
		} else { 
			model.setViewName("driver/driverDocument");
		}
		return model;
	}
	
	@RequestMapping(value = "/apply/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Driver driver
			,HttpServletRequest request,@RequestParam("upfile") MultipartFile upfile) {
		
		log.info(driver.toString());

		int result = 0;
		if (upfile != null && !upfile.isEmpty()) {
			// 파일을 저장하는 로직 작성
			String renameFileName = saveFile(upfile, request);

			System.out.println(renameFileName);

			if (renameFileName != null) {
				driver.setImageOri(upfile.getOriginalFilename());
				driver.setImageRe(renameFileName);
			}
		}
		result = service.saveDriver(driver);
		
		log.info(driver.toString());		
		
		if(result > 0) {
			model.addObject("msg", "드라이버 지원이 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "드라이버 지원에 실패했습니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");		
		
		return model;
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.POST})
	public ModelAndView update(ModelAndView model, @ModelAttribute Driver driver
			,HttpServletRequest request,@RequestParam("upfile") MultipartFile upfile) {
		
		log.info(driver.toString());

		int result = 0;
		if (upfile != null && !upfile.isEmpty()) {
			if (driver.getImageRe() != null) {
				deleteFile(driver.getImageRe(), request);
			}
			String renameFileName = saveFile(upfile, request);
			System.out.println(renameFileName);
			if (renameFileName != null) {
				driver.setImageOri(upfile.getOriginalFilename());
				driver.setImageRe(renameFileName);
			}
		}
		result = service.updateDriver(driver);
		
		log.info(driver.toString());		
		
		if(result > 0) {
			model.addObject("msg", "수정 되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "수정에 실패했습니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");		
		
		return model;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView driverMypage(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		
		Driver driver = service.selectDriver(loginMember.getUserNo());
		List<Review> review = reviewService.searchSUserNo(loginMember.getUserNo());
		List<Call> endCall = callService.driverEndCallList(loginMember.getUserNo());
		
		log.info(endCall.toString());
		
		model.addObject("driver", driver);
		model.addObject("review", review);
		model.addObject("endCall", endCall);
		
		model.setViewName("driver/driverMyPage");
		
		return model;
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String renamePath = null; 
		String originalFileName = null;
		String renameFileName = null;
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/images";
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);

		// Save Path가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);

		if(!folder.exists()) {
			folder.mkdirs();
		}

		originalFileName = file.getOriginalFilename();
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renameFileName;

		try {
			// 업로드 한 파일 데이터를 지정한 파일에 저장.
			file.transferTo(new File(renamePath));
		}catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}

		return renameFileName;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/images";				
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);
		
		File file = new File(savePath+"/"+fileName);
		if(file.exists()) {
			file.delete();
		}
	}
	
	@ResponseBody
	@RequestMapping("/carNoCheck")
	public Object carNoCheck(@RequestParam("carNo")String carNo) {
		
		log.info("carNo : {}", carNo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("carNoCheck", service.carNoCheck(carNo));
		
		return map;
	}
}
