package com.petcab.work.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.review.model.dao.ReviewDao;
import com.petcab.work.review.model.vo.RReply;
import com.petcab.work.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	@Transactional
	public int saveReview(Review review) {
		int result = 0;
		
		if(review.getReviewNo() > 0) {
			result = reviewDao.updateReview(review);
		} else{
			result = reviewDao.insertReview(review);
		}
		
		return result;
	}
	
	@Override
	public int getReviewCount(Search search ) {
		
		return reviewDao.selectCount(search);
	}

	@Override
	public List<Review> getReviewList(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return reviewDao.selectReviewList(rowBounds, search);
	}

	@Override
	public List<Review> searchUserNo(int userNo) {
		return reviewDao.searchUserNo(userNo);
	}

	@Override
	public Review findreviewNo(int reviewNo) {
		
		return reviewDao.selectReviewDetail(reviewNo);
	}

	@Override
	public int updateViewNo(int reviewNo) {
		
		return reviewDao.updateViewNo(reviewNo);
	}

	@Override
	public int delete(int reviewNo) {
		
		return reviewDao.delete(reviewNo);
	}

	public List<Review> searchSUserNo(int userNo) {
		
		return reviewDao.searchSUserNo(userNo);
	}

	// 메인화면에 띄우는 리뷰
	@Override
	public List<Review> mainReviewList() {
		// TODO Auto-generated method stub
		return reviewDao.mainReviewList();
	}

	// 마이페이지에서 리뷰 더보기로 띄우는 리스트
	@Override
	public List<Review> myReviewUserId(String userId) {
		// TODO Auto-generated method stub
		return reviewDao.selectMyReviewUserId(userId);
	}
	
	@Override
	public Review selectCallNoReview(int callNo) {
		return reviewDao.selectCallNoReview(callNo);
	}

	@Override
	public List<Review> driverReviewList(int userNo) {
		// TODO Auto-generated method stub
		return reviewDao.driverReviewList(userNo);
	}
}
