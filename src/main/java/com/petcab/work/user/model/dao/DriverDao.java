package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.user.model.vo.Driver;

@Mapper
public interface DriverDao {

	int insertDriver(Driver driver);

	Driver selectDriver(@Param("userNo") int userNo);

	Driver selectDriverMember(@Param("userNo") int userNo);

	List<Driver> selectWaitDrivers();

	List<Driver> selectDriverAll();

	int selectDriverCount();

	List<Driver> selectAllDrivers(RowBounds rowBounds);

	int getRejectDriverCount();

	List<Driver> selectRejectDrivers(RowBounds rowBounds);

	int applyDriver(int userNo);


}
