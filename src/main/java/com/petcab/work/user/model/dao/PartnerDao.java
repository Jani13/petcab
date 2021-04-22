package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.vo.Partner;

@Mapper
public interface PartnerDao {

	int insertPartner(Partner partner);

	List<Partner> selectPtHospital();

	List<Partner> selectPtKinderGarten();

	List<Partner> selectPtShop();

	Partner selectPartner(@Param("userNo") int userNo);

	List<Partner> selectPtYesList();

	List<Partner> selectWaitPartners();

	int getRejectPartnerCount();

	List<Partner> selectRejectPartners(RowBounds rowBounds);

	int applyPartner(int userNo);

	List<Partner> selectAllPartners(RowBounds rowBounds, Search search);

	int selectPartnerCount(Search search);

	int updatePartner(Partner partner);

	Partner selectPartnerDetail(@Param("userNo")int userNo);

	String selectPartnerChart();

	List<Partner> selectpChartList();

	List<Partner> selectpChartCount();

	List<Partner> selectShop();

	List<Partner> selectHospital();

	List<Partner> selectpSchool();

	int rejectPartner(int userNo);
}
