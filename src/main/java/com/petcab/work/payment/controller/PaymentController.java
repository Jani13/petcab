package com.petcab.work.payment.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.petcab.work.payment.model.service.PaymentService;
import com.petcab.work.payment.model.vo.Payment;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;

import lombok.extern.slf4j.Slf4j;

import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.http.HttpEntity;

@Slf4j
@Controller
public class PaymentController {

	@Autowired private PaymentService service;
	
	private IamportClient api;
	
	public PaymentController() {
		this.api = new IamportClient("1426572333225365","9ynAIUqQkHvRsKdQ7t3FPGfTZrGXh6XrFl2nfsdA9IsCsFtA8wgYdwRcYx9fE7GjsIGHbUilCKX5qrGy");
	}
		@ResponseBody
		@RequestMapping(value="/call/gn_pay/{imp_uid}")
		public IamportResponse<com.siot.IamportRestClient.response.Payment> paymentByImpUid(
				Model model
				, Locale locale
				, HttpSession session
				, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
		{	
				return api.paymentByImpUid(imp_uid);
		}
		
	 @RequestMapping(value={"/call/gn_pay"}, method = {RequestMethod.GET})
	 public String book_gn_payview() {
	      log.info("결제 요청페이지");
	      return "/call/book_gn_pay";
	   } 
	 @RequestMapping(value={"/call/book/cancel"}, method = {RequestMethod.GET})
	 public String book_gn_doneview() {
		 log.info("완료요청페이지");
		 return "/call/book_gn_done";
	 } 
	


// 카카오페이 api만 사용했을때... 
//	 @RequestMapping(value={"/call/book_gn_pay"}, method = {RequestMethod.GET})
//	 public String book_em_payview() {
//	      log.info("결제 요청페이지");
//	      return "/call/book_gn_pay";
//	   }
//	 
//	 // 결제 준비&요청하기
//	 @ResponseBody
//	 @RequestMapping(value={"/call/gn_pay"}, method = {RequestMethod.POST})
//	 public String kakao_em_pay() {
//		try {
//			URL epay = new URL("https://kapi.kakao.com/v1/payment/ready"); // url 주소
//			HttpURLConnection link = (HttpURLConnection) epay.openConnection(); // 서버연결
//			link.setRequestMethod("POST"); //post 하라고 카카오에서 정해준거 그대로 복사
//			link.setRequestProperty("Authorization", "KakaoAK 34d9c469a68d547ed338c4d2d3cb0f54"); // 카카오에서 보여준거 복사해서 내가 받은 어드민 키 붙여 넣기
//			link.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//			link.setDoOutput(true);
//			// 밑에 파라미터 값 넣어줌
//			String prm = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=PETCAB&quantity=1&total_amount=500&tax_free_amount=0&approval_url=http://localhost:8089/work/call/book_gn_done&fail_url=http://localhost:8089/fail&cancel_url=http://localhost:8089//work/call/book_gn_done";
//			OutputStream give = link.getOutputStream(); 
//			DataOutputStream datagive = new DataOutputStream(give);
//			datagive.writeBytes(prm);
//			datagive.close();
//			
//			int result = link.getResponseCode();
//			
//			InputStream take ;
//			if(result==200) {
//				take = link.getInputStream();
//			}else {
//				take = link.getErrorStream();
//			}
//			InputStreamReader read = new InputStreamReader(take);
//			BufferedReader cas = new BufferedReader(read); // 형변환 해주는 아이 BufferedReader
//			return cas.readLine();
//			
//		} catch (MalformedURLException e) {			
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		 return null;
//	 }
//	 
//	 // 결제 승인하는 부분 만들기
//	 
//	 @RequestMapping(value={"/call/book_gn_done"}, method = {RequestMethod.GET})
//	 public String book_em_doneview(@RequestParam("pg_token")String token,@RequestParam("tid")String tid ) {
//	      log.info("결제 승인페이지");
//	      try {
//				URL epay = new URL("https://kapi.kakao.com/v1/payment/approve");// url 주소
//				HttpURLConnection link = (HttpURLConnection) epay.openConnection(); // 서버연결
//				link.setRequestMethod("POST"); //post 하라고 카카오에서 정해준거 그대로 복사
//				link.setRequestProperty("Authorization", "KakaoAK 34d9c469a68d547ed338c4d2d3cb0f54"); 
//				link.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//				link.setDoOutput(true);
//				String prm ="cid=TC0ONETIME&tid="+tid+"&partner_order_id=partner_order_id&partner_user_id=partner_user_id&pg_token="+token;
//				OutputStream give = link.getOutputStream(); 
//				DataOutputStream datagive = new DataOutputStream(give);
//				datagive.writeBytes(prm);
//				datagive.close(); 
//				
//				int result = link.getResponseCode();
//				
//				InputStream take ;
//				if(result==200) {
//					take = link.getInputStream();
//				}else {
//					take = link.getErrorStream();
//				}
//				InputStreamReader read = new InputStreamReader(take);
//				BufferedReader cas = new BufferedReader(read); // 형변환 해주는 아이 BufferedReader
//				return cas.readLine();
//				
//			} catch (MalformedURLException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			} 
//		 return"call/book_gn_done";
//	   }

}