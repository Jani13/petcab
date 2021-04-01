package com.petcab.work.call.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.call.model.vo.Call;

@Mapper
public interface CallDao {
	
	int insertCall(Call call);
	
	int updateCall(Call call);
	
	Call selectCall(int callNo);
}