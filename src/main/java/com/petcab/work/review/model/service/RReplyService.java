package com.petcab.work.review.model.service;

import java.util.ArrayList;
import java.util.List;

import com.petcab.work.review.model.vo.RReply;

public interface RReplyService {

//	List<RReply> replyList(int replyNo);

	int saveRReply(RReply rReply);
	
	ArrayList<RReply> getReplyList(int listLimit);
	
	int updateReply(RReply rReply);
	
	int deleteReply(RReply rReply);

}
