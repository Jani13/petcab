package com.petcab.work.call.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;

public interface CallService {
	
	int insertCall(Call call);
	
	int insertEmgCall(EmgCall emgCall);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);
	
	List<EmgCall> selectEmgCall(int callNo); // many
	
	EmgCall selectEmgCallWithNoDogs(int callNo); // one
		
	EmgCall	selectEmgCallWithDogs(int callNo); // one
	
	List<Call> selectCallListForDriver(); // 드라이버 예약선택
	
	int updateCallByDriver(@Param("dUserNo") int dUserNo, @Param("callNo") int callNo); // 드라이버넘버

	List<Call> driverWaitCallList();

	List<Call> driverEndCallList(int userNo);

	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();
	
	int selectEmerCall(int callNo);

	int selectCancelledCall();

	List<Call> useCallUserId(String userId);

	List<Call> endCallUserId(String userId);

	List<Call> waitECallList();

	List<Call> eCallList(int userNo);

	List<Call> selectGenCallList(Search search);

	List<Call> selectEmgCallList(Search search);

	List<Call> getCancelCallList(Search search);
	
	// 리뷰에서 종료된 예약 띄우기
	List<Call> callEndList(int callNo);

	int searchGenCallCount(Search search);

	int searchEmgCallCount(Search search);

	int searchCancelCount(Search search);

	List<Call> callEndList(String userId);

	int finishCallByDriver(int callNo);

	List<EmgCall> useECallUserId(String userId);
}
