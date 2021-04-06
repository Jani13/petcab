package com.petcab.work.call.model.service;

import java.util.List;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;

public interface CallService {
	int insertCall(Call call);
	
	int insertEmgCall(EmgCall emgCall);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);
	
	EmgCall selectEmgCall(int callNo);

	List<Call> driverWaitCallList(int userNo);

	List<Call> driverEndCallList(int userNo);

	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();

	int selectCancelledCall();

}
