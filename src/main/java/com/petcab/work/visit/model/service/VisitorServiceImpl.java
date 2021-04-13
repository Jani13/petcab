package com.petcab.work.visit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.visit.model.dao.VisitCountDao;

@Service
public class VisitorServiceImpl implements VisitorService {
	@Autowired
	private VisitCountDao visitCountDao;
	
	@Override
	public int getVisitorCount() {
		
		return visitCountDao.selectVisitorCount();
	}

}
