package com.petcab.work.call.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.petcab.work.call.model.vo.Call;

@Mapper
public interface CallDao {
	
	int insertCall(Call call);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);

	List<Call> driverWaitCallList();

	List<Call> driverEndCallList(@Param("userNo") int userNo);

	List<Call> searchUserCallList(@Param("userNo")int userNo);
	
	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();

	int selectCancelledCall();
}
