package com.petcab.work.user.model.service;



import java.util.List;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
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

	int getMemberCount(Search search);

	List<Member> selectMemberAddr();

	List<Member> selectAllMember(Search search);

	int applyDriver(int userNo);

	int applyPartner(int userNo);

	List<Member> selectAllUsers(PageInfo pageInfo);

	int getUserCount();

	int updateMInfo(Member member);

	List<Member> getChartDateCount();

	List<Member> getSearchMember(PageInfo pageInfo, String searchOption, String keyword);

//	List<Member> selectAllMember(PageInfo pageInfo, String searchOption, String keyword);

}
