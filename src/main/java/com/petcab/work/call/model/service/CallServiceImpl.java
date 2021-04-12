package com.petcab.work.call.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.call.model.dao.CallDao;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.common.util.PageInfo;

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
	public List<Call> driverWaitCallList() {

		return callDao.driverWaitCallList();
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
	public List<EmgCall> selectEmgCall(int callNo) {
		
		return callDao.selectEmgCall(callNo);
	}
	
	@Override
	public List<Call> useCallUserId(String userId) {
		
		return callDao.useCallUserId(userId);
	}

	@Override
	public List<Call> endCallUserId(String userId) {
	
		return callDao.endCallUserId(userId);
	}

	@Override
	public List<Call> waitECallList() {
		
		return callDao.waitECallList();
	}

	@Override
	public List<Call> eCallList(int userNo) {
		
		return callDao.eCallList(userNo);
	}

	@Override
	public List<Call> selectGenCallList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return callDao.selectGenCallList(rowBounds);
	}

	@Override
	public int getGenCallCount() {
		
		return callDao.selectGenCall();
	}
	
	@Override
	public EmgCall selectEmgCallWithNoDogs(int callNo) {
		
		return callDao.selectEmgCallWithNoDogs(callNo);
	}
	
	// 리뷰에서 종료된 예약 띄우기
	@Override
	public List<Call> callEndList(String userId) {
		
		return callDao.selectcallEndList(userId);
	}

}
