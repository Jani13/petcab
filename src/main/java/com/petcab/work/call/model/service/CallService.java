package com.petcab.work.call.model.service;

import com.petcab.work.call.model.vo.Call;

public interface CallService {
	int insertCall(Call call);
	
	int updateCall(Call call);
	
	Call selectCall(int callNo);

}
