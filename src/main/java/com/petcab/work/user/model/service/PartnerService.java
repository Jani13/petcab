package com.petcab.work.user.model.service;

import java.util.List;

import com.petcab.work.user.model.vo.Partner;

public interface PartnerService {

	int savePartner(Partner partner);

	List<Partner> ptListSearchYes();

}
