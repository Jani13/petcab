package com.petcab.work.payment.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.common.util.Search;
import com.petcab.work.payment.model.vo.Payment;

@Mapper
public interface PaymentDao {

	int selectTodayPaymentAmount();

	int insertPayInfo(Payment payment);

	int updatPay(String impUid);

	int searchPayCount(Search search);

	List<Payment> searchPayList(RowBounds rowBounds, Search search);

	List<Payment> selectByCallType(String btnValue);

	int updatePaid(int callNo);
	
}
