package com.petcab.work.call.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.call.model.vo.Call;
import com.petcab.work.call.model.vo.EmgCall;
import com.petcab.work.common.util.Search;

@Mapper
public interface CallDao {
	
	int insertCall(Call call);
	
	int insertEmgCall(EmgCall emgCall);
	
	int updateCall(int callNo);
	
	Call selectCall(int callNo);

	List<Call> driverWaitCallList();

	List<Call> driverEndCallList(@Param("userNo") int userNo);
	
	int selectAllCall();

	int selectGenCall();

	int selectEmergCall();
	
	int selectEmerCall(int callNo);

	int selectCancelledCall();

	List<EmgCall> selectEmgCall(@Param("callNo") int callNo);
	
	List<Call> useCallUserId(String userId);

	List<Call> endCallUserId(String userId);

	List<Call> waitECallList();

	List<Call> eCallList(int userNo);

	List<Call> selectGenCallList(RowBounds rowBounds, Search search);
	
	EmgCall selectEmgCallWithNoDogs(int callNo);

	List<Call> selectEmgCallList(RowBounds rowBounds, Search search);

	List<Call> selectCancelCallList(RowBounds rowBounds, Search search);
	
	// 리뷰에서 종료된 예약 띄우기
	List<Call> selectcallEndList(String userId);

	List<Call> selectCallListForDriver();

	int updateCallByDriver(@Param("dUserNo") int dUserNo, @Param("callNo") int callNo);

	int searchGenCallCount(Search search);

	int searchEmgCallCount(Search search);

	int searchCancelCount(Search search);
}
