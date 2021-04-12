package com.petcab.work.user.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

public interface DriverService {

	int saveDriver(Driver driver);
	
	Driver selectDriver(int userNo);

	Driver selectDriverMember(int userNo);

	List<Driver> selectWaitDrivers();

	int getDriverCount();

	List<Driver> rNumSelectDrivers(PageInfo pageInfo);

	int getRejectDriverCount();

	List<Driver> selectRejectDrivers(PageInfo pageInfo);

	int applyDriver(int userNo);

	int updateDInfo(Member member, Driver driver);

}
