package com.petcab.work.review.model.service;

import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.review.model.vo.Review;

public interface ReviewService {

	int getReviewCount();

	List<Review> getReviewList(PageInfo pageInfo);

	int saveReview(Review review);

	List<Review> searchUserNo(int userNo);

	Review findreviewNo(int reviewNo);

}
