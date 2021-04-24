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

	// 메인화면에 띄우는 리뷰
	List<Review> mainReviewList();

	// 마이페이지에서 리뷰 더보기로 띄우는 리스트
	List<Review> selectMyReviewUserId(String userId);
	
	Review selectCallNoReview(int callNo);

	List<Review> driverReviewList(int userNo);


}
