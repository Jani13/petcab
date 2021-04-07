package com.petcab.work.user.model.service;

import com.petcab.work.user.model.vo.Partner;

public interface PartnerService {

	int savePartner(Partner partner);

	Partner selectPartner(int userNo);

}
