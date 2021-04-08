package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.petcab.work.user.model.vo.Driver;

@Mapper
public interface DriverDao {

	int insertDriver(Driver driver);

	Driver selectDriver(@Param("userNo") int userNo);

	Driver selectDriverMember(@Param("userNo") int userNo);

	List<Driver> selectWaitDrivers();

	List<Driver> selectDriverAll();

	List<Driver> selectDrivers();

}
