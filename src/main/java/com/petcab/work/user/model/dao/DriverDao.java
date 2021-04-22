package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

@Mapper
public interface DriverDao {

	int insertDriver(Driver driver);

	Driver selectDriver(@Param("userNo") int userNo);

	Driver selectDriverMember(@Param("userNo") int userNo);

	List<Driver> selectWaitDrivers();

	List<Driver> selectDriverAll();

	int selectDriverCount(Search search);

	List<Driver> selectAllDrivers(RowBounds rowBounds, Search search);

	int getRejectDriverCount();

	List<Driver> selectRejectDrivers(RowBounds rowBounds);

	int applyDriver(int userNo);

	int updateDriver(Driver driver);

	Driver selectCarNo(@Param("carNo") String carNo);

	int rejectDriver(int userNo);

}
