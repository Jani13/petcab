package com.petcab.work.user.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.common.util.PageInfo;
import com.petcab.work.common.util.Search;
import com.petcab.work.user.model.dao.DriverDao;
import com.petcab.work.user.model.dao.MemberDao;
import com.petcab.work.user.model.dao.PartnerDao;
import com.petcab.work.user.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private DriverDao driverDao;
	
	@Autowired
	private PartnerDao partnerDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Member login(String userId, String userPwd) {
		Member loginMember = this.findMemberByUserId(userId);
		
		return loginMember != null && 
				passwordEncoder.matches(userPwd, loginMember.getUserPwd())? loginMember : null;
	}

	@Override
	@Transactional
	public int saveMember(Member member) {
		int result = 0;
		
		if(member.getUserNo() != 0) {
			result = memberDao.updateMember(member);
		} else {
			member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
			
			result = memberDao.insertMember(member);
		}
		
		return result;
	}
	
	@Override
	public boolean validate(String userId) {
		Member member = this.findMemberByUserId(userId);
		
		return member != null;
	}

	@Override
	public Member findMemberByUserId(String userId) {
		
		return memberDao.selectMember(userId);
	}
	
	@Override
	@Transactional
	public int deleteMember(String userId) {
		
		return memberDao.deleteMember(userId);
	}

	@Override
	public Member searchMember(String userName, String phone) {
		return memberDao.searchMember(userName,phone);
	}

	@Override
	public Member searchMemberPwd(String userId, String phone) {	
		return memberDao.searchMemberPwd(userId, phone);
	}

	@Override
	public int updatePwd(Member member) {
		
		String encPassword = passwordEncoder.encode(member.getUserPwd());
		
		member.setUserPwd(encPassword);
		
		return memberDao.updatePwd(member);
	}

//	adminPage에서 사용
	// 모든 멤버 카운터
	@Override
	public int getMemberCount(Search search) {
		
		return memberDao.selectCount(search);
	}

	// 제휴업체검색에서 사용
	@Override
	public List<Member> selectMemberAddr() {
		return memberDao.selectPartnerAddr();
	}

	// adminPage 모든 멤버 조회 리스트	
	@Override 
	public List<Member> selectAllMember(Search search) { 
	    int offset = (search.getCurrentPage() -1) * search.getListLimit(); 
	    RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
	  
	    return memberDao.rNumSelectMemberAll(rowBounds, search); 
	}
	 
	@Override
	@Transactional
	public int applyDriver(int userNo) {
		int result = driverDao.applyDriver(userNo);
		
		if (result > 0) {
			result = memberDao.applyDriver(userNo);
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	@Transactional
	public int applyPartner(int userNo) {
		int result = memberDao.applyPartner(userNo);
		
		if (result > 0) {
			result = partnerDao.applyPartner(userNo);
		} else {
			result = 0;
		}
		return result;
	}

	@Override
	public List<Member> selectAllUsers(Search search) {
		int offset = (search.getCurrentPage() -1) * search.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, search.getListLimit());
		
		return memberDao.selectAllUsers(rowBounds, search);
	}
	
	// ROLE_MEMBER만 카운터
	@Override
	public int getUserCount(Search search) {
		
		return memberDao.selectUserCount(search);
	}

	@Override
	public int updateMInfo(Member member) {
		
		return memberDao.updateMInfo(member);
	}

	@Override
	public int kakaoCheck(String email) {
		// TODO Auto-generated method stub
		return  memberDao.kakaoCheck(email);
	}

	@Override
	public int kakaoInsert(String email) {
		// TODO Auto-generated method stub
		return memberDao.kakaoInsert(email);
	}

	@Override
	public Member kakaoLogin(String email) {
		// TODO Auto-generated method stub
		return memberDao.kakaoLogin(email);
	}
	
	public List<Member> getChartDateCount() {
		
		return memberDao.selectChartDateCount();
	}

	

}
