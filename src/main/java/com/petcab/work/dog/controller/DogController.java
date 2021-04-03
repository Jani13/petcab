package com.petcab.work.dog.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
		
		@RequestMapping(value = "/dog/dogInformation/enroll", method = {RequestMethod.POST})
		public ModelAndView enroll(ModelAndView model, @ModelAttribute Dog dog) {
			
			log.info(dog.toString());
			
//			int result = service.saveDog(dog);
			log.info(dog.toString());		
			
//			if(result > 0) {
				model.addObject("msg", "등록 되었습니다.");
				model.addObject("location", "/signup/Information");
//			} else {
//				model.addObject("msg", " 실패했습니다.");
//				model.addObject("location", "/");
//			}
			
			model.setViewName("common/msg");		
			
			return model;
		}
		
//		@RequestMapping("/signup/Information")
//		@ResponseBody
//		@Transactional
//		public String Infromation(ModelAndView model, 
//				@ModelAttribute Dog dog,
//				@ModelAttribute Member member) {
//			
//			int result = service.saveDog(dog,member);
//			return "/signup/Information";
//		}
//		private String saveFile(MultipartFile file, HttpServletRequest request) {
//			String renamePath = null; 
//			String originalFileName = null;
//			String renameFileName = null;
//			String rootPath = request.getSession().getServletContext().getRealPath("resources");
//			String savePath = rootPath + "/upload/photo";				
//			
//			log.debug("Root Path : " + rootPath);
//			log.debug("Save Path : " + savePath);
//			
//			// Save Path가 실제로 존재하지 않으면 폴더를 생성하는 로직
//			File folder = new File(savePath);
//			
//			if(!folder.exists()) {
//				folder.mkdirs();
//			}
//			
//			originalFileName = file.getOriginalFilename();
//			renameFileName = 
//					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
//					originalFileName.substring(originalFileName.lastIndexOf("."));
//			renamePath = savePath + "/" + renameFileName;
//			
//			try {
//				// 업로드 한 파일 데이터를 지정한 파일에 저장한다.
//				file.transferTo(new File(renamePath));
//			}catch (IOException e) {
//				System.out.println("파일 전송 에러 : " + e.getMessage());
//				e.printStackTrace();
//			}
//			
//			return renameFileName;
//		}
			
}
