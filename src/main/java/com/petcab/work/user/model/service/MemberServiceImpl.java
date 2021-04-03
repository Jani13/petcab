package com.petcab.work.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.petcab.work.user.model.dao.MemberDao;
import com.petcab.work.user.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;
	
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
		int result = 0;
		
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		
		result = memberDao.updatePwd(member);
		
		return result;
	}



	

}
