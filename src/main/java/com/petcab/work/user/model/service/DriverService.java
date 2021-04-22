package com.petcab.work.user.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

public interface DriverService {

	int saveDriver(Driver driver);
	
	Driver selectDriver(int userNo);

	Driver selectDriverMember(int userNo);

	List<Driver> selectWaitDrivers();

	int getDriverCount(Search search);

	List<Driver> rNumSelectDrivers(Search search);

	int getRejectDriverCount();

	List<Driver> selectRejectDrivers(PageInfo pageInfo);

	int updateDriver(Driver driver);
	
	Driver findCarNo(String carNo);
	
	boolean carNoCheck(String carNo);

	int rejectDriver(int userNo);
}
