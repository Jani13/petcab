package com.petcab.work.ques.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.ques.model.vo.QuesReply;

public interface QuesService {

	List<Ques> getQuesList(PageInfo pageInfo);
	
	List<Ques> getQuesList2(Search search);

	int getQuesCount();

	int getQuesCount2(Search search);
	
	int saveQues(Ques ques);

	Ques findQuesByNo(int quesNo);

	int delete(int quesNo);

	int saveQuesReply(QuesReply quesReply);

	int updateViewNo(int quesNo);

	QuesReply findQuesReplyByNo(int quesNo);

	int deleteReply(int quesNo);

	List<Ques> getQuesListForAdmin();


}
