package com.petcab.work.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.petcab.work.call.model.service.CallService;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.payment.model.vo.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {

	@Autowired 
	private PaymentService service;
	
	@Autowired 
	private CallService callService;
	
	@RequestMapping(value = "call/payInfo/{callNo}", method= {RequestMethod.POST})
	public ModelAndView enroll(
			@PathVariable(name = "callNo") String callNo,
			ModelAndView model, 
			@RequestBody Payment payment) {
		
		log.info(payment.toString());
		
		int resultI = service.savePayInfo(payment,callNo);

		System.out.println("resultI : " + resultI);
		
		// GEN_CALL STATUS 결제 업데이트
		// 긴급만 '결제'로 업데이트되는데... 일반도 동일해야
		
		int resultU = service.updatePaid(Integer.parseInt(callNo));
		
		System.out.println("resultU : " + resultU);
		
		return model;
	}

}
