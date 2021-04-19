package com.petcab.work.payment.model.service;

import com.petcab.work.payment.model.vo.Payment;

public interface PaymentService {

	int selectAmount();

	int savePayInfo(Payment payment);
	
//	String PayReady();
	

}
