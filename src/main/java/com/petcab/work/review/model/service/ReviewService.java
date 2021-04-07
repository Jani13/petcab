package com.petcab.work.review.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.review.model.vo.Review;

public interface ReviewService {

	List<Review> getReviewList(PageInfo pageInfo);

	int getReviewCount();

	int saveReview(Review review);

	Review findreviewNo(int reviewNo);
	
	int delete(int reviewNo);

//	int updateViewNo(int reviewNo);

	List<Review> searchUserNo(int userNo);

	List<Review> searchSUserNo(int userNo);

}
