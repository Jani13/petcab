package com.petcab.work.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.petcab.work.review.model.vo.RReply;

public interface RReplyDao {

	int insertRRely(RReply rReply);

	ArrayList<RReply> replyList(int listLimit);

//	List<RReply> replyList(int replyNo);
	
	int updateReply(RReply rReply);
	int deleteReply(RReply rReply);


}
