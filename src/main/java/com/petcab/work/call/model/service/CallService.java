package com.petcab.work.call.model.service;

import java.util.List;

import com.petcab.work.call.model.vo.Call;

public interface CallService {
	int insertCall(Call call);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);

	List<Call> driverWaitCallList(int userNo);

	List<Call> driverEndCallList(int userNo);

}
