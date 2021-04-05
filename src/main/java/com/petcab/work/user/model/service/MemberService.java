package com.petcab.work.user.model.service;



import com.petcab.work.user.model.vo.Member;

public interface MemberService {
	Member login(String userId, String userPwd);
	
	int saveMember(Member member);	
	
	boolean validate(String userId);
	
	Member findMemberByUserId(String userId);
	
	int deleteMember(String userId);

	Member searchMember(String userName, String phone);

	Member searchMemberPwd(String userId, String phone);

	int updatePwd(Member member);
}
