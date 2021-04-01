package com.petcab.work.call.model.service;

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
	public int bookCall(Call call) {
		
		return 0;
	}

	@Override
	public int cancelCall(Call call) {
		
		return 0;
	}

	@Override
	public Call selectCallInfo(int callNo) {
		
		return null;
	}
	
}
