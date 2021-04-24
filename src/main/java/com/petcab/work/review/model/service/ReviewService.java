package com.petcab.work.review.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.review.model.vo.RReply;
import com.petcab.work.review.model.vo.Review;

public interface ReviewService {

	List<Review> getReviewList(Search search);

	int getReviewCount(Search search);

	int saveReview(Review review);

	Review findreviewNo(int reviewNo);
	
	int delete(int reviewNo);

	int updateViewNo(int reviewNo);
	
	List<Review> searchUserNo(int userNo);

	List<Review> searchSUserNo(int userNo);

	List<Review> mainReviewList();

	List<Review> myReviewUserId(String userId);
	
	Review selectCallNoReview(int callNo);

	List<Review> driverReviewList(int userNo);

}
