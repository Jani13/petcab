package com.petcab.work.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.review.model.dao.ReviewDao;
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
	public int getReviewCount() {
		
		return reviewDao.selectCount();
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return reviewDao.selectReviewList(rowBounds);
	}

	@Override
	public List<Review> searchUserNo(int userNo) {
		return reviewDao.searchUserNo(userNo);
	}

	@Override
	public Review findreviewNo(int reviewNo) {
		
		return reviewDao.selectReviewDetail(reviewNo);
	}

//	@Override
//	public int updateViewNo(int reviewNo) {
//		
//		return reviewDao.updateViewNo(reviewNo);
//	}

	@Override
	public int delete(int reviewNo) {
		System.out.println("2ddd22222ddd22" + reviewNo);
		return reviewDao.delete(reviewNo);
	}

}
