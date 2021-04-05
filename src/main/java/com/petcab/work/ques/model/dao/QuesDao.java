package com.petcab.work.ques.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.petcab.work.ques.model.vo.Ques;

public interface QuesDao {

	List<Ques> selectQuesList(RowBounds rowBounds);

	int selectCount();
	
	int insertQues(Ques ques);

	int updateQues(Ques ques);

	Ques selectQuesDetail(int quesNo);

}
