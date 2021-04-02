package com.petcab.work.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.user.model.dao.DriverDao;
import com.petcab.work.user.model.vo.Driver;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DriverServiceImpl implements DriverService {
	@Autowired
	private DriverDao driverDao;
	
	@Override
	@Transactional
	public int saveDriver(Driver driver) {
		int result = 0;

		result = driverDao.insertDriver(driver);

		return result;
	}

	@Override
	public Driver selectDriver(int userNo) {
		return driverDao.selectDriver(userNo);
	}

}
