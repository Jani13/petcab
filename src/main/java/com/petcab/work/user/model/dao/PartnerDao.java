package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.petcab.work.user.model.vo.Partner;

@Mapper
public interface PartnerDao {

	int insertPartner(Partner partner);

	List<Partner> selectPtHospital();

	List<Partner> selectPtKinderGarten();

	List<Partner> selectPtShop();

	Partner selectPartner(@Param("userNo") int userNo);

	List<Partner> selectPtYesList();

}
