package com.petcab.work.user.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.dao.PartnerDao;
import com.petcab.work.user.model.vo.Partner;

@Service
public class PartnerServiceImpl implements PartnerService {
	@Autowired
	private PartnerDao partnerDao;
	
	@Override
	public int savePartner(Partner partner) {
		int result = 0;
		
		result = partnerDao.insertPartner(partner);
		
		return result;
	}

	@Override
	public List<Partner> ptSearchHospital() {
		
		return partnerDao.selectPtHospital();
	}

	@Override

	public List<Partner> ptSearchKinderGarten() {
		
		return partnerDao.selectPtKinderGarten();
	}

	@Override
	public List<Partner> ptSearchShop() {
		
		return partnerDao.selectPtShop();
	}

	@Override
	public Partner selectPartner(int userNo) {
		
		return partnerDao.selectPartner(userNo);
	}

	@Override
	public List<Partner> selectWaitPartners() {
		return partnerDao.selectWaitPartners();
	}

	@Override
	public int getRejectPartnerCount() {
		return partnerDao.getRejectPartnerCount();
	}

	@Override
	public List<Partner> selectRejectPartners(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit(); 
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return partnerDao.selectRejectPartners(rowBounds);
	}
	
	@Override
	public List<Partner> selectPartners(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return partnerDao.selectAllPartners(rowBounds, search);
	}

	@Override
	public int getPartnerCount(Search search) {
		
		return partnerDao.selectPartnerCount(search);
	}

	@Override
	public int updatePartner(Partner partner) {
		return partnerDao.updatePartner(partner);
	}

	@Override
	public Partner getPartnerDetail(int userNo) {
		
		return partnerDao.selectPartnerDetail(userNo);
	}

	@Override
	public List<Partner> getpChartList() {
	
		return partnerDao.selectpChartList();
	}

	@Override
	public List<Partner> getpChartCount() {

		return partnerDao.selectpChartCount();
	}

	@Override
	public List<Partner> getShopList() {
		return partnerDao.selectShop();
	}

	@Override
	public List<Partner> getHospitalList() {
		return partnerDao.selectHospital();
	}

	@Override
	public List<Partner> getSchoolList() {
		return partnerDao.selectpSchool();
	}

	@Override
	public int rejectPartner(int userNo) {
		// TODO Auto-generated method stub
		return partnerDao.rejectPartner(userNo);
	}

}
