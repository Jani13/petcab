package com.petcab.work.payment.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.payment.model.vo.Payment;

@Mapper
public interface PaymentDao {

	int selectTodayPaymentAmount();

	int insertPayInfo(Payment payment);

	int updatPay(String impUid);

	

}
