package com.petcab.work.payment.model.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDao {

	int selectTodayPaymentAmount();
	

}
