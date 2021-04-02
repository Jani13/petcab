package com.petcab.work.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.petcab.work.review.model.vo.Review;

public interface ReviewDao {

	int updateReview(Review review);

	int insertReview(Review review);

	int selectCount();

	List<Review> selectReviewList(RowBounds rowBounds);


}
