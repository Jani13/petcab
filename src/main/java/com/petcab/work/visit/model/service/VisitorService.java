package com.petcab.work.visit.model.service;

import java.util.List;

import com.petcab.work.visit.model.vo.VisitCountVo;

public interface VisitorService {

	int getVisitorCount();

	List<VisitCountVo> getChartVisitCount();

}
