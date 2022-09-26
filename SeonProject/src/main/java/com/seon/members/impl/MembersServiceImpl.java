package com.seon.members.impl;

import java.util.List;



import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.seon.members.service.MembersDAO;
import com.seon.members.service.MembersService;
import com.seon.members.service.MembersVO;



@Service("memberService")
public class MembersServiceImpl implements MembersService {
	
	@Resource(name = "memberDAOMybatis")
	private MembersDAO dao;

	//아이디 중복 체크
	@Override
	public int memberId_check(String memberId) throws Exception {
		int result = dao.memberId_check(memberId);
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public int memberNickname_check(String memberNickname) throws Exception {
		int result = dao.memberNickname_check(memberNickname);
		return result;
	}
	
	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		dao.signUpMember(membersVo);		
	}
	
	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = dao.loginMember(membersVo);
		return result;
	}
	
	@Override
	public MembersVO selectMember(String memberId) throws Exception {		
		return dao.selectMember(memberId);
	}
	
	
}