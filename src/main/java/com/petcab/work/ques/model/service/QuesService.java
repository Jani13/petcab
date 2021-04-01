package com.petcab.work.ques.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.ques.model.vo.Ques;

public interface QuesService {

	List<Ques> getQuesList(PageInfo pageInfo);

	int getQuesCount();

	int saveQues(Ques ques);

}