package com.petcab.work.user.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

public interface PartnerService {

	int savePartner(Partner partner);

	List<Partner> ptSearchHospital();

	List<Partner> ptSearchKinderGarten();

	List<Partner> ptSearchShop();

	Partner selectPartner(int userNo);

	List<Partner> selectWaitPartners();

	int getRejectPartnerCount();

	List<Partner> selectRejectPartners(PageInfo pageInfo);
	
	List<Partner> selectPartners(Search search);

	int getPartnerCount(Search search);

	int updatePartner(Partner partner);

	Partner getPartnerDetail(int userNo);

	List<Partner> getpChartList();

	List<Partner> getpChartCount();

	List<Partner> getShopList();

	List<Partner> getHospitalList();

	List<Partner> getSchoolList();

	int rejectPartner(int userNo);
	
}
