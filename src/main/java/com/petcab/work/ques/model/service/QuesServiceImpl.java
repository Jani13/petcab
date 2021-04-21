package com.petcab.work.ques.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.ques.model.dao.QuesDao;
import com.petcab.work.ques.model.service.QuesService;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.ques.model.vo.QuesReply;

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
	public List<Ques> getQuesList2(Search search) {
		
		System.out.println(search);

		
		int offset = (search.getCurrentPage() - 1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return quesDao.selectQuesList2(rowBounds, search);
	}
	
	@Override
	public int getQuesCount() {
		
		return quesDao.selectCount();
	}

	@Override
	public int getQuesCount2(Search search) {
		
		return quesDao.selectCount2(search);
	}
	
	@Override
	public Ques findQuesByNo(int quesNo) {
		
		return quesDao.selectQuesDetail(quesNo);
		
	}

	@Override
	public int delete(int quesNo) {
		
		
		return quesDao.delete(quesNo);
	}

	@Override
	public int saveQuesReply(QuesReply quesReply) {
		
		return quesDao.insertQuesReply(quesReply);
	}

	@Override
	public int updateViewNo(int quesNo) {
		
		return quesDao.updateViewNo(quesNo);
	}

	@Override
	public QuesReply findQuesReplyByNo(int quesNo) {
		
		return quesDao.selectQuesReply(quesNo);
	}

	@Override
	public int deleteReply(int quesNo) {
		
		return quesDao.deleteReply(quesNo);
	}


	@Override
	public List<Ques> getQuesListForAdmin() {
		
		return quesDao.selectQuesList();
	}

	


}
