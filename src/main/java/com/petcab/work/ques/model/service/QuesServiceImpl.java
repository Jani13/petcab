package com.petcab.work.ques.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.ques.model.dao.QuesDao;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class QuesServiceImpl implements QuesService {
	@Autowired
	private QuesDao quesDao;
	
	@Override
	@Transactional
	public int saveQues(Ques ques) {
		int result = 0;
		
		if(ques.getQuesNo() != 0) {
			result = quesDao.updateQues(ques);
		} else {
			result = quesDao.insertQues(ques);
		}
		return result;

	}

	@Override
	public List<Ques> getQuesList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return quesDao.selectQuesList(rowBounds);
		
	}

	@Override
	public int getQuesCount() {
		
		return quesDao.selectCount();
	}

	@Override
	public Ques findQuesByNo(int quesNo) {
		
		return quesDao.selectQuesDetail(quesNo);
		
	}

}
