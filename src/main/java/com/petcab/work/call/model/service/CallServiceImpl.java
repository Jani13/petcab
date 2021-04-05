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
		
		return callDao.insertCall(call);
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
<<<<<<< HEAD
	public List<Call> driverWaitCallList() {
		return callDao.driverWaitCallList();
=======
	public List<Call> driverWaitCallList(int userNo) {
		// TODO Auto-generated method stub
		return callDao.driverWaitCallList(userNo);
>>>>>>> parent of d4e329e (0405_관리자마이페이지작업중)
	}

	@Override
	public List<Call> driverEndCallList(int userNo) {
<<<<<<< HEAD
=======
		// TODO Auto-generated method stub
>>>>>>> parent of d4e329e (0405_관리자마이페이지작업중)
		return callDao.driverEndCallList(userNo);
	}

	@Override
	public List<Call> searchUserCallList(int userNo) {
		return callDao.searchUserCallList(userNo);
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

}
