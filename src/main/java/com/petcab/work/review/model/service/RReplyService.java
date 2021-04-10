package com.petcab.work.review.model.service;

import java.util.List;

import com.petcab.work.review.model.vo.RReply;

public interface RReplyService {

//	List<RReply> replyList(int replyNo);

	int saveRReply(RReply rReply);

	List<RReply> getReplyList(int listLimit);

}
