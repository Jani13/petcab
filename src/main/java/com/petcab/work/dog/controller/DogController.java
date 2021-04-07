package com.petcab.work.dog.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.user.model.vo.Dog;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DogController {
	
	@Autowired
	private DogService service;

	
		@RequestMapping("/signup/Information")
		public String InfromationView() {
			log.info("정보요청");
			return "/signup/Information";
		}
		
		@RequestMapping("/dog/dogInformation")
		public String dogInfromationView() {
			log.info("등록요청");
			return "/dog/dogInformation";
		}
		
//		@RequestMapping("/dog/mdogInformation")
//		public String mdogInformationView() {
//			log.info("수정요청");
//			return "/dog/mdogInformation";
//		}
//		
				
		@RequestMapping(value="/dog/mdogInformation", method = {RequestMethod.GET} )
		public ModelAndView dogUpdate(@SessionAttribute(name="loginMember", required = false) Member loginMember
				,ModelAndView model) {
			List<Dog> dogs = service.searchUserId(loginMember.getUserId());
			log.info(dogs.toString());
			
			model.addObject("dogs", dogs);
			model.setViewName("dog/mdogInformation");
			
			return model;
		}
		
//		public ModelAndView dogupdate(
//				@SessionAttribute(name="loginMember", required = false) Member loginMember,
//				@RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request, 
//				@ModelAttribute Dog dog, ModelAndView model) {
//			int result = 0;
//			
//			System.out.println(dog);
//			
//			if(loginMember.getUserId().equals(dog.getUserId())) {
//				if(reloadFile != null && !reloadFile.isEmpty()) {
//					if(dog.getImageRe() != null) {
//						deleteFile(dog.getImageRe(), request);
//					}
//					
//					String renameFileName = saveFile(reloadFile, request);
//					
//					if(renameFileName != null) {
//						dog.setImageOri(reloadFile.getOriginalFilename());
//						dog.setImageRe(renameFileName);
//					}
//				}
//				
//				result = service.saveDog(dog);
//				
//				if(result > 0) {
//					model.addObject("msg", "정상적으로 수정되었습니다.");
//					model.addObject("location", "/dog/update?dogNo=" + dog.getDogNo());
//				} else {
//					model.addObject("msg", "수정을 실패하였습니다.");
//					model.addObject("location", "/dog/list");
//				}
//			} else {
//				model.addObject("msg", "잘못된 접근입니다.");
//				model.addObject("location", "/");
//			}		
//			
//			model.setViewName("common/msg");
//			return model;
//		}
		
		private void deleteFile(String fileName, HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/dog";				
		
		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);
		
		File file =  new File(savePath + "/" + fileName);
		
		if(file.exists()) {
			file.delete();
		}	
	}

		@RequestMapping(value = "/dog/dogInformation/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(
				@SessionAttribute(name="loginMember", required = false) Member loginMember,
				ModelAndView model,HttpServletRequest request, @ModelAttribute Dog dog,@RequestParam("upfile") MultipartFile upfile) {

			System.out.println(dog);

			System.out.println(upfile.getOriginalFilename());		
			
			int result = 0;
			
			if(loginMember.getUserId().equals(dog.getUserId())) {
				dog.setDogNo(loginMember.getUserNo());
				
				if(upfile != null && !upfile.isEmpty()) {
					// 파일을 저장하는 로직 작성
					String renameFileName = saveFile(upfile,request);
					
					System.out.println(renameFileName);
					
					if(renameFileName != null) {
						dog.setImageOri(upfile.getOriginalFilename());
						dog.setImageRe(renameFileName);
					}
				}
				
				result = service.saveDog(dog);
				
				if(result > 0) {
					model.addObject("msg", "등록되었습니다.");
					model.addObject("location", "/user/mypage");
				} else {
					model.addObject("msg", "등록을 실패하였습니다.");
					model.addObject("location", "/dog/dogInformation/enroll");
				}			
				
			}else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/");
			}
			
			model.setViewName("common/msg");
			
			return model;
			
		}

		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String renamePath = null; 
			String originalFileName = null;
			String renameFileName = null;
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/dog";				
			
			log.info("Root Path : " + rootPath);
			log.info("Save Path : " + savePath);
			
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
		


}
