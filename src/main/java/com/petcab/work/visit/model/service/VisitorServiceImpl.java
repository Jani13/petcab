package com.petcab.work.visit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.visit.model.dao.VisitCountDao;
import com.petcab.work.visit.model.vo.VisitCountVo;

@Service
public class VisitorServiceImpl implements VisitorService {
	@Autowired
	private VisitCountDao visitCountDao;
	
	@Override
	public int getVisitorCount() {
		
		return visitCountDao.selectVisitorCount();
	}

	@Override
	public List<VisitCountVo> getChartVisitCount() {
		
		return visitCountDao.selectChartVisitCount();
	}

}
