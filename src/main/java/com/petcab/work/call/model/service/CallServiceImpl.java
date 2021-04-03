package com.petcab.work.call.model.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

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

	@Override
	public List<Call> driverWaitCallList(int userNo) {
		// TODO Auto-generated method stub
		return callDao.driverWaitCallList(userNo);
	}

	@Override
	public List<Call> driverEndCallList(int userNo) {
		// TODO Auto-generated method stub
		return callDao.driverEndCallList(userNo);
	}

}
