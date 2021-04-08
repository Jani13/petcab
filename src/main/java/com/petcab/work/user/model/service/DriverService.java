package com.petcab.work.user.model.service;

import java.util.List;

import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

public interface DriverService {

	int saveDriver(Driver driver);
	
	Driver selectDriver(int userNo);

	Driver selectDriverMember(int userNo);

	List<Driver> selectWaitDrivers();

	List<Driver> selectDrivers();

}
