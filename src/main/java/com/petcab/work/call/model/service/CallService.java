package com.petcab.work.call.model.service;

import com.petcab.work.call.model.vo.Call;

public interface CallService {
	int bookCall(Call call);
	
	int cancelCall(Call call);
	
	Call selectCallInfo(int callNo);
}
