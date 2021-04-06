package com.petcab.work.call.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.call.model.dao.CallDao;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CallServiceImpl implements CallService {
	@Autowired
	private CallDao callDao;

	@Override
	public int insertCall(Call call) {
		
		return callDao.insertCall(call);
	}

	@Override
	public int insertEmgCall(EmgCall emgCall) {
		
		return callDao.insertEmgCall(emgCall);
	}
	
	@Override
	public int updateCall(int callNo) {
		
		return callDao.updateCall(callNo);
	}

	@Override
	public Call selectCall(int callNo) {
		
		return callDao.selectCall(callNo);
	}

	@Override
	public List<Call> driverWaitCallList(int userNo) {

		return callDao.driverWaitCallList(userNo);
	}

	@Override
	public List<Call> driverEndCallList(int userNo) {

		return callDao.driverEndCallList(userNo);
	}

	@Override
	public int selectAllCall() {
		return callDao.selectAllCall();
	}

	@Override
	public int selectGenCall() {
		return callDao.selectGenCall();
	}

	@Override
	public int selectEmergCall() {
		return callDao.selectEmergCall();
	}

	@Override
	public int selectCancelledCall() {
		return callDao.selectCancelledCall();
	}

	@Override
	public EmgCall selectEmgCall(int callNo) {
		
		return callDao.selectEmgCall(callNo);
	}

}
