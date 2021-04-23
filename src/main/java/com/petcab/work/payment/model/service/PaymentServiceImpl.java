package com.petcab.work.payment.model.service;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.dao.CallDao;
import com.petcab.work.common.util.Search;
import com.petcab.work.payment.model.dao.PaymentDao;
import com.petcab.work.payment.model.vo.Payment;

import lombok.extern.java.Log;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@Service
@Log
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private CallDao callDao;
	
	@Override
	public int selectAmount() {
		
		return paymentDao.selectTodayPaymentAmount();
	}

	@Override
	@Transactional
	public int savePayInfo(Payment payment,String callNo) {
		int result =  paymentDao.insertPayInfo(payment);
		if(result>0) {
			result = callDao.updateUid(payment.getMerchantUid(),callNo);
		}else {
			result=0;
		}
		return result;
	}

	@Override
	public int updatPay(String impUid) {
		
		return paymentDao.updatPay(impUid);
	}

	@Override
	public int searchPayCount(Search search) {
		
		return paymentDao.searchPayCount(search);
	}


	@Override
	public List<Payment> searchPayList(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit(); 
	    RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return paymentDao.searchPayList(rowBounds, search);
	}


	@Override
	public List<Payment> searchByCallType(String btnValue) {
		
		return paymentDao.selectByCallType(btnValue);
	}

	@Override
	public int updatePaid(int callNo) {
		
		return paymentDao.updatePaid(callNo);
	}

////	private static final String HOST = "https://kapi.kakao.com";
////	private Ready Ready;
////	@Override
////	public String PayReady() {
////		RestTemplate restTemplate = new RestTemplate();
////		
////		// 서버로 요청할 Header
////		HttpHeaders link = new HttpHeaders();
////		link.add("Authorization", "KakaoAK 34d9c469a68d547ed338c4d2d3cb0f54");
////		link.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
////		
////		// 서버로 요청할 Body
////        MultiValueMap<String, String> prm = new LinkedMultiValueMap<String, String>();
////        prm.add("cid", "TC0ONETIME");
////		prm.add("partner_order_id", "partner_order_id");
////		prm.add("partner_user_id", "partner_user_id");
////		prm.add("item_name", "PETCAB");
////		prm.add("quantity", "1");
////		prm.add("total_amount", "500");
////        prm.add("tax_free_amount", "100");
////        prm.add("approval_url", "http://localhost:8089/work/call/book_gn_done");
////        prm.add("cancel_url", "http://localhost:8089/work/call/book_gn_done");
////        prm.add("fail_url", "http://localhost:8089/work/call/book_gn_done");
////		
////         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(prm, link);
////         try {
////        	 Ready = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, Ready.class);
////             
////             log.info("" + Ready);
////             
////             return Ready.getNext_redirect_pc_url();
////  
////         } catch (RestClientException e) {
////           
////             e.printStackTrace();
////         } catch (URISyntaxException e) {
////            
////             e.printStackTrace();
////         }
////         
////         return "/pay";
//         
//     }

}
