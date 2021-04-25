package com.petcab.work.dog.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.dog.model.service.DogService;
import com.petcab.work.ques.model.vo.Ques;
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

   @RequestMapping(value={"/dog/mdogInformation"}, method = {RequestMethod.GET})
	public ModelAndView dogUpdate(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam(name="dogNo", required=false) Integer dogNo,
			ModelAndView model,			
			HttpServletRequest request) {

		List<Dog> dogs = null;
		Dog dog = null;
		
		dogs = service.searchUserId(loginMember.getUserId());

		log.info(dogs.toString());

		model.addObject("dogs", dogs);

		if(dogNo != null) {
			dog = service.searchByDogNo(dogNo);

			model.addObject("dog", dog);

			log.info(dog.toString());

			return model;
		}

		model.setViewName("dog/mdogInformation"); // html로 넘긴다.

		return model;
	}
   
   // 삭제된 메소드 다시 추가
	@RequestMapping(value="/dog/select", method = {RequestMethod.GET})
	@ResponseBody
	public Dog findDog(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam(name="dogNo") Integer dogNo,
			HttpServletRequest request) {

		System.out.println(dogNo);

		Dog dog = service.searchByDogNo(dogNo);

		return dog;
	}

	@RequestMapping(value="/dogs/{id}", method = {RequestMethod.GET})
	@ResponseBody
	public Dog findDog(
			@SessionAttribute(name="loginMember", required = false) Member loginMember,
			@RequestParam(name="dogNo") Integer dogNo,
			@PathVariable("id") String id,
			HttpServletRequest request) {

		System.out.println(dogNo);

		Dog dog = service.searchByDogNo(dogNo);

		return dog;
	}

	@RequestMapping(value = "/dog/view", method = {RequestMethod.GET})
	public ModelAndView view(
			@SessionAttribute(name="loginMember", required=false) Member loginMember,
			@RequestParam("dogNo") int dogNo, ModelAndView model) {

		List<Dog> dogs = new ArrayList<>();
		List<Dog> dogsReordered = new ArrayList<>();
		
		Dog dogClicked = null;
		
		dogs = service.searchUserId(loginMember.getUserId());
		
		dogClicked = service.searchByDogNo(dogNo);
		
		dogsReordered.add(dogClicked); // 선택한 dog index 0에 add
		
		// dogs의 item 중에서 dogNo에 해당하는 녀석 우선 제외
		for (Dog dog : dogs) {
			if(dog.getDogNo() != dogClicked.getDogNo()) {
				dogsReordered.add(dog);
			}
		}
				
		System.out.println(dogsReordered);

		model.addObject("dogs", dogsReordered);

		model.setViewName("dog/mdogInformation");

		return model;
	}

   // 애견정보 수정
     @RequestMapping(value="/dog/mdogInformation", method = {RequestMethod.POST} )
     public ModelAndView updatedog(@SessionAttribute(name="loginMember", required
     = false) Member loginMember, ModelAndView model,@RequestParam("reloadFile")
     MultipartFile reloadFile, HttpServletRequest request,  @ModelAttribute Dog dog) {
  	 
        int result = 0;

                        if(loginMember.getUserId().equals(dog.getUserId())) {
                        if(reloadFile != null && !reloadFile.isEmpty()) {
                           if(dog.getImageRe() != null) {
                              deleteFile(dog.getImageRe(), request);
                           }
                           
                           String renameFileName = saveFile(reloadFile, request);
                           
                           if(renameFileName != null) {
                              dog.setImageOri(reloadFile.getOriginalFilename());
                              dog.setImageRe(renameFileName);
                           }
                        }
                        
                        result = service.updateDog(dog);
         
         if(result > 0) {
            model.addObject("msg", "정상적으로 수정되었습니다.");
            model.addObject("location", "/user/mypage");
         } else {
            model.addObject("msg", "수정을 실패하였습니다.");
            model.addObject("location", "/user/mypage");
         }
                        } else {
                           model.addObject("msg", "잘못된 접근입니다.");
                           model.addObject("location", "/");
                        }      
      
      model.setViewName("common/msg");   
        
    return model;
    }
    
     // 애견정보 삭제
   @RequestMapping(value = "/dog/deleteDog", method = {RequestMethod.GET})
   public ModelAndView dogDelete(@RequestParam("dogNo") int dogNo, ModelAndView model) {
      int result = 0;
      
      result = service.deleteDog(dogNo);
      
      if(result > 0) {
         model.addObject("msg", " 삭제되었습니다 ^^ 감사합니다.");
         model.addObject("location", "/user/mypage");
      }else {
         model.addObject("msg", " 다시 삭제해주세요~");
         model.addObject("location", "/user/mypage");
      }
      
      model.setViewName("common/msg");
      
      return model;
      
   }
  
   // 등록된 파일 삭제
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

   @RequestMapping(value = "/dog/dogInformation/enroll", method = {RequestMethod.GET})
   public String enroll() {

      return "dog/dogInformation";
   }

   // 애견 등록
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

   // 사진파일 저장
   private String saveFile(MultipartFile file, HttpServletRequest request) {
      String renamePath = null; 
      String originalFileName = null;
      String renameFileName = null;
      String rootPath = request.getSession().getServletContext().getRealPath("resources");
      String savePath = rootPath + "/upload/dog";            

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

}