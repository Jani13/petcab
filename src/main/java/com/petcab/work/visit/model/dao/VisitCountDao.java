package com.petcab.work.visit.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.petcab.work.visit.model.vo.VisitCountVo;

@Mapper
public interface VisitCountDao {
	
	int insertVisitor(VisitCountVo vo);

	int selectVisitorCount();

	List<VisitCountVo> selectChartVisitCount();
}
