package com.petcab.work.call.model.service;

import java.util.List;

import com.petcab.work.call.model.vo.Call;

public interface CallService {
	int insertCall(Call call);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);

	List<Call> driverWaitCallList();

	List<Call> driverEndCallList(int userNo);

	List<Call> searchUserCallList(int userNo);

	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();

	int selectCancelledCall();

}
