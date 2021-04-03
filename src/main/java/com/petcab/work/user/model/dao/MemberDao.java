package com.petcab.work.user.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
}
