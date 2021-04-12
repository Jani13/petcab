package com.petcab.work.review.model.service;

import java.util.ArrayList;
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

//	@Override
//	public List<RReply> replyList(int replyNo) {
//		
//		return rReplyDao.replyList(replyNo);
//	}

	@Override
	public int saveRReply(RReply rReply) {
		
		return rReplyDao.insertRRely(rReply);
	}

	@Override
	public ArrayList<RReply> getReplyList(int listLimit) {
		System.out.println("ㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅㅅ" + rReplyDao.replyList(listLimit));
		return  rReplyDao.replyList(listLimit);
	}
	
	@Override
	public int updateReply(RReply rReply) {
		// TODO Auto-generated method stub
		System.out.println("서비스 쪽 : "+rReply.getContent());
		return rReplyDao.updateReply(rReply);
	}
	
	@Override
	public int deleteReply(RReply rReply) {
		// TODO Auto-generated method stub
		return rReplyDao.deleteReply(rReply);
	}
}
