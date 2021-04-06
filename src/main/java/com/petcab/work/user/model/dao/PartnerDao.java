package com.petcab.work.user.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.user.model.vo.Partner;

@Mapper
public interface PartnerDao {

	int insertPartner(Partner partner);
	

}
