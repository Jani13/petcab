package com.petcab.work.call.model.service;

import java.util.List;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.common.util.PageInfo;

public interface CallService {
	
	int insertCall(Call call);
	
	int insertEmgCall(EmgCall emgCall);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);
	
	List<EmgCall> selectEmgCall(int callNo); // many
	
	EmgCall selectEmgCallWithNoDogs(int callNo); // one

	List<Call> driverWaitCallList();

	List<Call> driverEndCallList(int userNo);

	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();

	int selectCancelledCall();

	List<Call> useCallUserId(String userId);

	List<Call> endCallUserId(String userId);

	List<Call> waitECallList();

	List<Call> eCallList(int userNo);

	List<Call> selectGenCallList(PageInfo pageInfo);

	int getGenCallCount();

}
