package com.petcab.work.payment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.payment.model.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDao paymentDao;
	
	
	@Override
	public int selectAmount() {
		
		return paymentDao.selectTodayPaymentAmount();
	}

}
