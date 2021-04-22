package com.petcab.work.user.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.user.model.dao.DriverDao;
import com.petcab.work.user.model.dao.MemberDao;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DriverServiceImpl implements DriverService {
	@Autowired
	private DriverDao driverDao;
	
	@Autowired
	private MemberDao memberDao;
	
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
	public int getDriverCount() {
		return driverDao.selectDriverCount();
	}

	@Override
	public List<Driver> rNumSelectDrivers(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return driverDao.selectAllDrivers(rowBounds);
	}

	@Override
	public int getRejectDriverCount() {
		return driverDao.getRejectDriverCount();
	}

	@Override
	public List<Driver> selectRejectDrivers(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return driverDao.selectRejectDrivers(rowBounds);
	}


	@Override
	public int updateDriver(Driver driver) {
		return driverDao.updateDriver(driver);
	}

}
