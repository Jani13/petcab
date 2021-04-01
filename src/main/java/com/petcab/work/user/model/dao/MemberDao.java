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
}
