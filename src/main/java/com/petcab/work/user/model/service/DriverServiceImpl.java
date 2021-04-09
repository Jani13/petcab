package com.petcab.work.user.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
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

	@Override
	public Driver selectDriverMember(int userNo) {
		
		return driverDao.selectDriverMember(userNo);
	}

	@Override
	public List<Driver> selectWaitDrivers() {
		return driverDao.selectWaitDrivers();
	}

	@Override
	public List<Driver> selectDrivers() {
		return driverDao.selectDrivers();
	}

	@Override
	public int getDriverCount() {
		return driverDao.selectDriverCount();
	}

	@Override
	public List<Driver> rNumSelectDrivers(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return driverDao.selectAllDrivers(rowBounds);
	}

}
