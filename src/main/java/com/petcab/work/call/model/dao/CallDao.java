package com.petcab.work.call.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.call.model.vo.Call;

@Mapper
public interface CallDao {
	
	int bookCall(Call call);
	
	int cancelCall(Call call);
	
	Call selectCallInfo(int callNo);
}
