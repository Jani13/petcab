package com.petcab.work.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petcab.work.review.model.dao.RReplyDao;
import com.petcab.work.review.model.vo.RReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RReplyServiceImpl implements RReplyService {
	@Autowired
	private RReplyDao rReplyDao;

	@Override
	public List<RReply> replyList(int replyNo) {
		
		return null;
//				rRelyDao.ReplyList(replyNo);
	}

	@Override
	public int saveRReply(RReply rReply) {
		
		return rReplyDao.insertRRely(rReply);
	}
}
