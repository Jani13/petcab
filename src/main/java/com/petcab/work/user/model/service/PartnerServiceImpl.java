package com.petcab.work.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Partner selectPartner(int userNo) {
		return partnerDao.selectPartner(userNo);
	}

}
