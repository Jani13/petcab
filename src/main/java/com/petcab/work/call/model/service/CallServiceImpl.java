package com.petcab.work.call.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.call.model.dao.CallDao;
import com.petcab.work.call.model.vo.Call;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CallServiceImpl implements CallService {
	@Autowired
	private CallDao callDao;

	@Override
	public int insertCall(Call call) {
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");	
//		Date sqlDate = null;
//		
//		sqlDate = (Date) sdf.parse((String));
//
//		call.setPickupTime(sqlDate);
		
		return callDao.insertCall(call);
	}

	@Override
	public int updateCall(Call call) {
		
		return 0;
	}

	@Override
	public Call selectCall(int callNo) {
		
		return callDao.selectCall(callNo);
	}
	
}
