package com.petcab.work.ques.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.ques.model.vo.Ques;
import com.petcab.work.ques.model.vo.QuesReply;

public interface QuesService {

	List<Ques> getQuesList(PageInfo pageInfo);

	int getQuesCount();

	int saveQues(Ques ques);

	Ques findQuesByNo(int quesNo);

	Ques delete(int quesNo);

	int saveQuesReply(QuesReply reply);

}
