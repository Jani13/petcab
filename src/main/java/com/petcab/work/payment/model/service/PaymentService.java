package com.petcab.work.payment.model.service;

import java.util.List;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.common.util.Search;
import com.petcab.work.payment.model.vo.Payment;

public interface PaymentService {

	int selectAmount();

	int savePayInfo(Payment payment, String callNo);

	int updatPay(String impUid);

	int searchPayCount(Search search);

	List<Payment> searchPayList(Search search);

	List<Payment> searchByCallType(String btnValue);

	int updatePaid(int callNo);
	
//	String PayReady();
	

}
