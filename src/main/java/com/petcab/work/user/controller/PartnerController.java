package com.petcab.work.user.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.user.model.service.MemberService;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.user.model.service.PartnerService;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/partner")
public class PartnerController {
	@Autowired
	private PartnerService partnerService;
	@Autowired
	private CallService callService;
	
	@Autowired
	private MemberService memberService;
	
	// 파트너 등록 페이지
	@RequestMapping("/")
	public ModelAndView partnerAppView(ModelAndView model,
			@SessionAttribute(name="loginMember", required = false )Member loginMember) {
		
		log.info(loginMember.toString());
		
		Partner partner = partnerService.selectPartner(loginMember.getUserNo());
		
		if(partner != null) {
			if(partner.getStatus().equals("W")) {
				model.addObject("msg", "승인이 대기중인 업체입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			} else if (partner.getStatus().equals("N")) {
				model.addObject("msg", "승인이 거절된 업체입니다.");
				model.addObject("location", "/");
				model.setViewName("common/msg");
			} else {
				model.addObject("partner", partner);
				model.setViewName("partner/partner");
			}
		} else {
			model.setViewName("partner/partner");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/partApply", method = {RequestMethod.POST})
	public ModelAndView partApply(
			ModelAndView model,
			HttpServletRequest request,
			@ModelAttribute Partner partner,
			@RequestParam("upfile") MultipartFile upfile) {
		
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			
			String renameFileName = saveFile(upfile,request);
			
			System.out.println(renameFileName);
			
			if(renameFileName != null) {
				partner.setImageOri(upfile.getOriginalFilename());
				partner.setImageRe(renameFileName);
			}
		}
		
		result = partnerService.savePartner(partner);
		
		log.info(partner.toString());

		if(result > 0) {
			model.addObject("msg", "파트너 등록 요청에 성공했습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "파트너 등록 요청에 실패했습니다. 다시 시도해 주세요.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.POST})
	public ModelAndView update(ModelAndView model, @ModelAttribute Partner partner
			,HttpServletRequest request,@RequestParam("upfile") MultipartFile upfile) {
		
		
		log.info(partner.toString());

		int result = 0;
		if (upfile != null && !upfile.isEmpty()) {
			if (partner.getImageRe() != null) {
				deleteFile(partner.getImageRe(), request);
			}
			String renameFileName = saveFile(upfile, request);
			System.out.println(renameFileName);
			if (renameFileName != null) {
				partner.setImageOri(upfile.getOriginalFilename());
				partner.setImageRe(renameFileName);
			}
		}
		
		
		result = partnerService.updatePartner(partner);
		
		log.info(partner.toString());
		
		if(result > 0) {
			model.addObject("msg", "수정에 성공했습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "수정에 실패했습니다. 다시 시도해 주세요.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 제휴 업체 검색 페이지
	@RequestMapping("/partnerMain")
	public String partnerMainView() {
		
		return "partner/partnerMain";
	}
	
	@RequestMapping(value = "/partHospital", method = {RequestMethod.GET})
	public ModelAndView partHospitalView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchHospital();
		
		log.info(partnerList.toString());
		
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partHospital");
		
		return model;
	}
	
	@RequestMapping(value = "/partKindergarten")
	public ModelAndView partKindergardenView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchKinderGarten();
		
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partKindergarden");
		
		return model;
	}
	
	@RequestMapping(value = "/partShop")
	public ModelAndView partShopView(ModelAndView model) {
		
		List<Partner> partnerList = partnerService.ptSearchShop();
		if(partnerList.size() == 0) {
			partnerList = null;
		}
		
		model.addObject("partnerList", partnerList);
		model.setViewName("partner/partShop");
		return model;
	}
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView partnerMypage(@SessionAttribute(name="loginMember", required = false) Member loginMember
			,ModelAndView model) {
		Partner partner = partnerService.selectPartner(loginMember.getUserNo());
		List<Call> waitCall = callService.waitECallList();
		List<Call> eCallList = callService.eCallList(loginMember.getUserNo());
		
		log.info(waitCall.toString());
		log.info(eCallList.toString());
		model.addObject("partner",partner);
		model.addObject("waitCall",waitCall);
		model.addObject("eCallList",eCallList);
		model.setViewName("mypage/partMyPage");
		return model;
	}
	
	@RequestMapping("/detail")
	public ModelAndView partnerDetail(ModelAndView model, 
			@RequestParam("userNo")int userNo) {
		
		Partner partner = partnerService.getPartnerDetail(userNo);
		
		log.info(partner.toString());
		
		model.addObject("partner", partner);
		model.setViewName("partner/partdetail");
		
		return model;
	}
	
	// 사진파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String renamePath = null; 
		String originalFileName = null;
		String renameFileName = null;
		String rootPath = request.getSession().getServletContext().getRealPath("resources");
		String savePath = rootPath + "/upload/partner";            

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
		String savePath = rootPath + "/upload/partner";

		log.debug("Root Path : " + rootPath);
		log.debug("Save Path : " + savePath);

		File file = new File(savePath + "/" + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
}
