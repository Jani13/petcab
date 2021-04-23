package com.petcab.work.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.common.util.Search;
import com.petcab.work.review.model.vo.RReply;
import com.petcab.work.review.model.vo.Review;

@Mapper
public interface ReviewDao {

	int updateReview(Review review);

	int insertReview(Review review);

	int selectCount(Search search);

	List<Review> selectReviewList(RowBounds rowBounds, Search search);

	List<Review> searchUserNo(@Param("userNo") int userNo);

	Review selectReviewDetail(int reviewNo);

	int updateViewNo(int reviewNo);

	int delete(int reviewNo);

	int insertRRely(RReply rReply);

	List<Review> searchSUserNo(int userNo);

	List<Review> mainReviewList();


}
