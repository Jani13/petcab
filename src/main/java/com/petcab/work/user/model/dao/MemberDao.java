package com.petcab.work.user.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.petcab.work.user.model.vo.Member;

@Mapper
public interface MemberDao {
	
	Member selectMember(@Param("id") String id);
	
	int insertMember(Member member);
	
	int updateMember(Member member);
	
	int deleteMember(@Param("id") String id);

	Member searchMember(@Param("userName")String userName, @Param("phone")String phone);

	Member searchMemberPwd(@Param("userId")String userId, @Param("phone") String phone);

	int updatePwd(Member member);

	int selectCount();

	List<Member> selectPartnerAddr();

	/*
	 * List<Member> selectMemberAll(RowBounds rowBounds);
	 */
	List<Member> rNumSelectMemberAll(RowBounds rowBounds);

	int applyDriver(int userNo);

	int applyPartner(int userNo);
	
	List<Member> selectAllUsers(RowBounds rowBounds);

	int selectUserCount();

	int updateMInfo(Member member);
	
	/*카카오 회원 가입 및 로그인 시작============================*/ 
	int kakaoCheck(String email);
	
	int kakaoInsert(String email);
	
	Member kakaoLogin(String email);
	/*카카오 회원 가입 및 로그인 끝 =============================*/ 
}
