package com.petcab.work.user.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.user.model.dao.MemberDao;
import com.petcab.work.user.model.dao.PartnerDao;
import com.petcab.work.user.model.vo.Driver;
import com.petcab.work.user.model.vo.Member;
import com.petcab.work.user.model.vo.Partner;

@Service
public class PartnerServiceImpl implements PartnerService {
	@Autowired
	private PartnerDao partnerDao;
	
	@Autowired
	private MemberDao memberDao;
	
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
	public int applyPartner(int userNo) {
		return partnerDao.applyPartner(userNo);
	}
	
	@Override
	public List<Partner> selectPartners(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return partnerDao.selectAllPartners(rowBounds);
	}

	@Override
	public int getPartnerCount() {
		
		return partnerDao.selectPartnerCount();
	}

	@Override
	@Transactional
	public int updatePInfo(Member member, Partner partner) {
		int result = 0;
		result = memberDao.updateMInfo(member);
		member = memberDao.selectMember(member.getUserId());
		if (result > 0) {
			return partnerDao.updatePInfo(partner);
		} else {
			return 0;
		}
	}

	

}
