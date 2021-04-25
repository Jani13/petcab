package com.petcab.work.call.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.petcab.work.call.model.dao.CallDao;
import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;

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
	public int selectEmerCall(int callNo) {
		
		return callDao.selectEmerCall(callNo);
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
	public List<Call> selectGenCallList(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return callDao.selectGenCallList(rowBounds, search);
	}
	
	@Override
	public EmgCall selectEmgCallWithNoDogs(int callNo) {
		
		return callDao.selectEmgCallWithNoDogs(callNo);
	}

	@Override
	public List<Call> selectEmgCallList(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return callDao.selectEmgCallList(rowBounds, search);
	}

	@Override
	public List<Call> getCancelCallList(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return callDao.selectCancelCallList(rowBounds, search);
	}
	
	// 리뷰에서 종료된 예약 띄우기
	@Override
	public List<Call> callEndList(String userId) {
		
		return callDao.selectcallEndList(userId);
	}

	@Override
	public List<Call> selectCallListForDriver() {
		
		return callDao.selectCallListForDriver();
	}

	@Override
	public int updateCallByDriver(@Param("dUserNo") int dUserNo, @Param("callNo") int callNo) {
		
		System.out.println("serviceImpl ... dUserNo : " + dUserNo);
		
		return callDao.updateCallByDriver(dUserNo, callNo);
	}

	@Override
	public int searchGenCallCount(Search search) {
		
		return callDao.searchGenCallCount(search);
	}

	@Override
	public int searchEmgCallCount(Search search) {
		
		return callDao.searchEmgCallCount(search);
	}

	@Override
	public int searchCancelCount(Search search) {
		
		return callDao.searchCancelCount(search);
	}

	@Override
	public List<Call> callEndList(int callNo) {
		return null;
	}

	@Override
	public EmgCall selectEmgCallWithDogs(int callNo) {
		
		return callDao.selectEmgCallWithDogs(callNo);
	}

	@Override
	public int finishCallByDriver(int callNo) {
		
		return callDao.finishCallByDriver(callNo);
	}

	@Override
	public List<EmgCall> useECallUserId(String userId) {
		// TODO Auto-generated method stub
		return callDao.useECallUserId(userId);
	}

}
