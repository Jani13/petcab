package com.petcab.work.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.review.model.vo.Review;

public interface ReviewDao {

	int updateReview(Review review);

	int insertReview(Review review);

	int selectCount();

	List<Review> selectReviewList(RowBounds rowBounds);

	List<Review> searchUserNo(@Param("userNo") int userNo);

<<<<<<< HEAD
	List<Review> searchSUserNo(int userNo);
	
	Review selectReviewDetail(int reviewNo);

=======
>>>>>>> parent of d4e329e (0405_관리자마이페이지작업중)

}
