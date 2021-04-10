package com.petcab.work.review.model.dao;

import java.util.List;

import com.petcab.work.review.model.vo.RReply;

public interface RReplyDao {

	int insertRRely(RReply rReply);

	List<RReply> replyList(int listLimit);

//	List<RReply> replyList(int replyNo);


}
